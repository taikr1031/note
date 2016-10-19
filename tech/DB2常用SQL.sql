--��������
UPDATE HR_ASS_MONTH_RESULT C SET C.ORG_UNIT_ID = 
(
	SELECT A.COUNTY_ID FROM MD_EMPLOYEE A WHERE C.EMPLOYEE_ID=A.ID
) 
WHERE EXISTS (SELECT A.COUNTY_ID FROM MD_EMPLOYEE A WHERE C.EMPLOYEE_ID=A.ID)

/**************************** OLAP���� Begin ****************************/
--OLAP������ʹ�á� OVER������һ������������һ�����ʽ�����������Ƕ���һ�������򣨻��߿���˵�ǽ��������OVERǰ��ĺ���ֻ��OVER����Ľ���������á�
--OLAP�������� ����ɣ�  ����  OVER(PARTITION BY �Ӿ�     ORDER BY �Ӿ�        ROWS��RANGE�Ӿ�)

SELECT 
	ROW_NUMBER() OVER(ORDER BY A.CORP_CODE) AS "ORDER_NUM",
	A.CORP_CODE, A.CORP_NAME, A.SUP_CORP_CODE,
	AVG(CAST (A.CORP_CODE AS DECIMAL(18,2))) OVER(PARTITION BY A.SUP_CORP_CODE) AS "AVG_COUNTY",
	AVG(CAST (A.CORP_CODE AS DECIMAL(18,1))) OVER() AS "AVG_TOTAL"
FROM T_B_CORP AS A

--��ѯ�������Ų�����������
SELECT  
    ROW_NUMBER() OVER(ORDER BY SALARY) AS ���,  
    NAME AS ����,  
    DEPT AS ����,  
    SALARY AS ����  
FROM  
(  
    --����    ����  ����  
    VALUES  
    ('����','�г���',4000),  
    ('�Ժ�','������',2000),  
    ('����','�г���',5000),  
    ('���','������',5000),  
    ('����','�г���',NULL),  
    ('����','������',4000)  
) AS EMPLOY(NAME,DEPT,SALARY); 

--PARTITION BY DEPT. �����ϲ�ѯ����ϣ�׷�ӶԲ���Ա����ƽ�����ʺ�ȫ��Ա����ƽ�����ʵĲ�ѯ
SELECT  
    ROW_NUMBER() OVER() AS ���,  
    ROW_NUMBER() OVER(PARTITION BY DEPT ORDER BY SALARY) AS �������,  
    NAME AS ����,  
    DEPT AS ����,  
    SALARY AS ����,  
    AVG(SALARY) OVER(PARTITION BY DEPT) AS ����ƽ������,  
    AVG(SALARY) OVER() AS ȫԱƽ������  
FROM  
(  
    --����    ����  ����  
    VALUES  
    ('����','�г���',4000),  
    ('�Ժ�','������',2000),  
    ('����','�г���',5000),  
    ('���','������',5000),  
    ('����','�г���',NULL),  
    ('����','������',4000)  
) AS EMPLOY(NAME,DEPT,SALARY);

--RANK�� DENSE_RANK��NULLS FIRST��NULLS LAST. 
--RANK�ǵȼ�����������˼.RANK�ǵȼ�����������˼�����ĺ���׵Ĺ��ʶ���5000�����ǲ��������ڶ���
--�����������Ĺ��ʶ���4000����ôRANK�����������ǵ��ģ���DENSE_RANK�������ǵ����أ�����������������֮������������������ڶ���������RANK����Ĭ��û�е�����
SELECT  
    ROW_NUMBER() OVER(ORDER BY SALARY desc NULLS FIRST) AS RN,  
    RANK() OVER(ORDER BY SALARY desc NULLS FIRST) AS RK,  
    DENSE_RANK() OVER(ORDER BY SALARY desc NULLS FIRST) AS D_RK,  
    NAME AS ����,  
    DEPT AS ����,  
    SALARY AS ����  
FROM  
(  
    --����    ����  ����  
    VALUES  
    ('����','�г���',4000),  
    ('�Ժ�','������',2000),  
    ('����','�г���',5000),  
    ('���','������',5000),  
    ('����','�г���',NULL),  
    ('����','������',4000)  
) AS EMPLOY(NAME,DEPT,SALARY)

--OVER���ֳ�����һ��ROWS�Ӿ䡣����������һ��ROWS�Ӿ�Ľṹ��ROWS BETWEEN <��������> AND <��������> 
--��ѯһ��ÿ��Ա���Ĺ����Լ�����С����������Ա����ƽ������
SELECT  
    NAME AS ����,  
    SALARY AS ����,  
    SUM(SALARY) OVER(ORDER BY SALARY NULLS FIRST ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS С�ڱ��˹��ʵ��ܶ�,  
    SUM(SALARY) OVER(ORDER BY SALARY NULLS FIRST ROWS BETWEEN  CURRENT ROW AND UNBOUNDED FOLLOWING) AS ���ڱ��˹��ʵ��ܶ�,  
    SUM(SALARY) OVER(ORDER BY SALARY NULLS FIRST ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS �����ܶ�1,  
    SUM(SALARY) OVER() AS �����ܶ�2  
FROM  
(  
    --����    ����  ����  
    VALUES  
    ('����','�г���',4000),  
    ('�Ժ�','������',2000),  
    ('����','�г���',5000),  
    ('���','������',5000),  
    ('����','�г���',NULL),  
    ('����','������',4000)  
) AS EMPLOY(NAME,DEPT,SALARY)

--LAG �� LEAD ���������������£�LAG(���ʽ���ֶ�, ƫ����, Ĭ��ֵ, IGNORE NULLS��RESPECT NULLS)��LAG������ƫ�ƣ�LEAD������ƫ�ƣ���ҿ�һ������SQL�Ĳ�ѯ�����һĿ��Ȼ�ˡ�
SELECT  
    NAME AS ����,  
    SALARY AS ����,  
    LAG(SALARY,0) OVER(ORDER BY SALARY) AS LAG0,  
    LAG(SALARY) OVER(ORDER BY SALARY) AS LAG1,  
    LAG(SALARY,2) OVER(ORDER BY SALARY) AS LAG2,  
    LAG(SALARY,3,0,'IGNORE NULLS') OVER(ORDER BY SALARY) AS LAG3,  
    LAG(SALARY,4,-1,'RESPECT NULLS') OVER(ORDER BY SALARY) AS LAG4,  
    LEAD(SALARY) OVER(ORDER BY SALARY) AS LEAD  
FROM  
(  
    --����    ����  ����  
    VALUES  
    ('����','�г���',2000),  
    ('�Ժ�','������',2400),  
    ('����','�г���',3000),  
    ('���','������',3200),  
    ('����','�г���',4000),  
    ('����','������',5000)  
) AS EMPLOY(NAME,DEPT,SALARY)
/**************************** OLAP���� End ****************************/

/**************************** ����ѧ������ʦ���γ̺ͳɼ���ѯ Begin ****************************/
--����ѧ������ʦ���γ̺ͳɼ���ѯ
SELECT * FROM Z_STUDENT --SNO NAME AGE SEX
SELECT * FROM Z_CLASS --CNO TNO NAME
SELECT * FROM Z_SCORE --SNO CNO SCORE
SELECT * FROM Z_TEACHER --TNO NAME

--��ѡ�����пγ̵�ѧ��
SELECT *
FROM Z_STUDENT S 
WHERE S.SNO IN 
(
	SELECT R.SNO
	FROM Z_SCORE R 
	GROUP BY R.SNO
	HAVING COUNT(1) = (SELECT COUNT(1) FROM Z_CLASS)
)

--������ѡ����c01,c04���ſγ̱�ŵ�ѧ��
SELECT * 
FROM Z_STUDENT S
WHERE S.SNO IN 
(
	SELECT DISTINCT R.SNO
	FROM Z_SCORE R 
	WHERE EXISTS (SELECT * FROM Z_SCORE R2 WHERE R.SNO = R2.SNO AND R2.CNO = 'c01')
		AND EXISTS (SELECT * FROM Z_SCORE R3 WHERE R.SNO = R3.SNO AND R3.CNO = 'c04')
)

--��ѯ��c01���γ̱ȡ�c04���γ̳ɼ��ߵ�����ѧ�����
SELECT T1.SNO
FROM (SELECT R.SNO, R.SCORE FROM Z_SCORE R WHERE R.CNO = 'c01') T1,
(SELECT R.SNO, R.SCORE FROM Z_SCORE R WHERE R.CNO = 'c04') T2
WHERE T1.SNO = T2.SNO AND T1.SCORE > T2.SCORE

--��ѯƽ���ɼ�����60�ֵ�ͬѧ��ѧ�ź�ƽ���ɼ�
SELECT R.SNO, AVG(R.SCORE) AS SCORE
FROM Z_SCORE R 
GROUP BY R.SNO
HAVING AVG(R.SCORE) > 60

--��ѯ����ͬѧ��ѧ�š�������ѡ�������ܳɼ�
SELECT S.SNO, S.NAME, RR.NUM, RR.TOTAL
FROM Z_STUDENT S 
LEFT JOIN 
(
	SELECT R.SNO, COUNT(1) AS NUM, SUM(R.SCORE) AS TOTAL
	FROM Z_SCORE R 
	GROUP BY R.SNO
) RR ON S.SNO = RR.SNO

--��ѯ���Ƴɼ���ߺ���͵ķ֣���������ʽ��ʾ���γ�ID����߷֣���ͷ�
SELECT C.CNO, C.NAME, MAX_T.SCORE, MIN_T.SCORE
FROM Z_CLASS C 
LEFT JOIN
(
	SELECT R.CNO, MAX(R.SCORE) AS SCORE
	FROM Z_SCORE R 
	GROUP BY R.CNO
) AS MAX_T ON C.CNO = MAX_T.CNO 
LEFT JOIN
(
	SELECT R.CNO, MIN(R.SCORE) AS SCORE
	FROM Z_SCORE R
	GROUP BY R.CNO
) AS MIN_T ON C.CNO = MIN_T.CNO

--������ƽ���ɼ��ӵ͵��ߺͼ����ʵİٷ����Ӹߵ���˳�� 
SELECT R.CNO, MAX(C.NAME) "�γ�", AVG(R.SCORE) AS "ƽ���ɼ�", 100 * SUM(CASE WHEN VALUE(R.SCORE, 0) >= 60 THEN 1 ELSE 0 END) / COUNT(1) AS "����ٷ���" 
FROM Z_SCORE R JOIN Z_CLASS C ON R.CNO = C.CNO
GROUP BY R.CNO
ORDER BY AVG(R.SCORE) ASC, 100 * SUM(CASE WHEN VALUE(R.SCORE, 0) >= 60 THEN 1 ELSE 0 END) / COUNT(1) DESC

--ͳ����ӡ���Ƴɼ�,������������:�γ�ID,�γ�����,[100-85],[85-70],[70-60],[ <60] 
SELECT C.CNO, C.NAME, 
	SUM(CASE WHEN R.SCORE BETWEEN 85 AND 100 THEN 1 ELSE 0 END) AS "85-100", 
	SUM(CASE WHEN R.SCORE BETWEEN 70 AND 85 THEN 1 ELSE 0 END) AS "70-85",
	SUM(CASE WHEN R.SCORE BETWEEN 60 AND 70 THEN 1 ELSE 0 END) AS "60-70",
	SUM(CASE WHEN R.SCORE < 60 THEN 1 ELSE 0 END) AS "60-"
FROM Z_CLASS AS C 
	LEFT JOIN Z_SCORE R ON C.CNO = R.CNO
GROUP BY C.CNO, C.NAME

--��ѯ���Ƴɼ�ǰ�����ļ�¼:(�����ǳɼ��������)
SELECT * 
FROM Z_SCORE R 
WHERE R.SCORE IN 
(
	SELECT R2.SCORE FROM Z_SCORE R2 WHERE R.CNO = R2.CNO ORDER BY R2.SCORE DESC FETCH FIRST 3 ROWS ONLY
)
ORDER BY R.CNO

--��ѯ�������ϲ�����γ̵�ͬѧ��ѧ�ż���ƽ���ɼ� 
SELECT R.SNO, AVG(R.SCORE) 
FROM Z_SCORE R 
WHERE R.SNO IN (SELECT R2.SNO FROM Z_SCORE R2 WHERE R2.SCORE < 60 GROUP BY R2.SNO HAVING COUNT(1) > 2)
GROUP BY R.SNO
/**************************** ����ѧ������ʦ���γ̺ͳɼ���ѯ End ****************************/

--��һ��SQL������ 0~99
WITH T(ID) AS
(
	SELECT 1 AS ID FROM SYSIBM.SYSDUMMY1 A 
	UNION ALL
	SELECT ID + 1 AS ID FROM T, SYSIBM.SYSDUMMY1 A WHERE ID < 99
)
SELECT ID FROM T
