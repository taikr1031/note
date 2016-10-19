--批量更新
UPDATE HR_ASS_MONTH_RESULT C SET C.ORG_UNIT_ID = 
(
	SELECT A.COUNTY_ID FROM MD_EMPLOYEE A WHERE C.EMPLOYEE_ID=A.ID
) 
WHERE EXISTS (SELECT A.COUNTY_ID FROM MD_EMPLOYEE A WHERE C.EMPLOYEE_ID=A.ID)

/**************************** OLAP函数 Begin ****************************/
--OLAP函数的使用。 OVER并不是一个函数，而是一个表达式，它的作用是定义一个作用域（或者可以说是结果集），OVER前面的函数只对OVER定义的结果集起作用。
--OLAP函数处理 的组成：  函数  OVER(PARTITION BY 子句     ORDER BY 子句        ROWS或RANGE子句)

SELECT 
	ROW_NUMBER() OVER(ORDER BY A.CORP_CODE) AS "ORDER_NUM",
	A.CORP_CODE, A.CORP_NAME, A.SUP_CORP_CODE,
	AVG(CAST (A.CORP_CODE AS DECIMAL(18,2))) OVER(PARTITION BY A.SUP_CORP_CODE) AS "AVG_COUNTY",
	AVG(CAST (A.CORP_CODE AS DECIMAL(18,1))) OVER() AS "AVG_TOTAL"
FROM T_B_CORP AS A

--查询结果集编号并按工资排序
SELECT  
    ROW_NUMBER() OVER(ORDER BY SALARY) AS 序号,  
    NAME AS 姓名,  
    DEPT AS 部门,  
    SALARY AS 工资  
FROM  
(  
    --姓名    部门  工资  
    VALUES  
    ('张三','市场部',4000),  
    ('赵红','技术部',2000),  
    ('李四','市场部',5000),  
    ('李白','技术部',5000),  
    ('王五','市场部',NULL),  
    ('王蓝','技术部',4000)  
) AS EMPLOY(NAME,DEPT,SALARY); 

--PARTITION BY DEPT. 在以上查询结果上，追加对部门员工的平均工资和全体员工的平均工资的查询
SELECT  
    ROW_NUMBER() OVER() AS 序号,  
    ROW_NUMBER() OVER(PARTITION BY DEPT ORDER BY SALARY) AS 部门序号,  
    NAME AS 姓名,  
    DEPT AS 部门,  
    SALARY AS 工资,  
    AVG(SALARY) OVER(PARTITION BY DEPT) AS 部门平均工资,  
    AVG(SALARY) OVER() AS 全员平均工资  
FROM  
(  
    --姓名    部门  工资  
    VALUES  
    ('张三','市场部',4000),  
    ('赵红','技术部',2000),  
    ('李四','市场部',5000),  
    ('李白','技术部',5000),  
    ('王五','市场部',NULL),  
    ('王蓝','技术部',4000)  
) AS EMPLOY(NAME,DEPT,SALARY);

--RANK、 DENSE_RANK、NULLS FIRST、NULLS LAST. 
--RANK是等级，排名的意思.RANK是等级，排名的意思，李四和李白的工资都是5000，他们并列排名第二。
--张三和王蓝的工资都是4000，怎么RANK函数的排名是第四，而DENSE_RANK的排名是第三呢？这正是这两个函数之间的区别。由于有两个第二名，所以RANK函数默认没有第三名
SELECT  
    ROW_NUMBER() OVER(ORDER BY SALARY desc NULLS FIRST) AS RN,  
    RANK() OVER(ORDER BY SALARY desc NULLS FIRST) AS RK,  
    DENSE_RANK() OVER(ORDER BY SALARY desc NULLS FIRST) AS D_RK,  
    NAME AS 姓名,  
    DEPT AS 部门,  
    SALARY AS 工资  
FROM  
(  
    --姓名    部门  工资  
    VALUES  
    ('张三','市场部',4000),  
    ('赵红','技术部',2000),  
    ('李四','市场部',5000),  
    ('李白','技术部',5000),  
    ('王五','市场部',NULL),  
    ('王蓝','技术部',4000)  
) AS EMPLOY(NAME,DEPT,SALARY)

--OVER部分出现了一个ROWS子句。我们先来看一下ROWS子句的结构：ROWS BETWEEN <上限条件> AND <下限条件> 
--查询一下每个员工的工资以及工资小于他的所有员工的平均工资
SELECT  
    NAME AS 姓名,  
    SALARY AS 工资,  
    SUM(SALARY) OVER(ORDER BY SALARY NULLS FIRST ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 小于本人工资的总额,  
    SUM(SALARY) OVER(ORDER BY SALARY NULLS FIRST ROWS BETWEEN  CURRENT ROW AND UNBOUNDED FOLLOWING) AS 大于本人工资的总额,  
    SUM(SALARY) OVER(ORDER BY SALARY NULLS FIRST ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS 工资总额1,  
    SUM(SALARY) OVER() AS 工资总额2  
FROM  
(  
    --姓名    部门  工资  
    VALUES  
    ('张三','市场部',4000),  
    ('赵红','技术部',2000),  
    ('李四','市场部',5000),  
    ('李白','技术部',5000),  
    ('王五','市场部',NULL),  
    ('王蓝','技术部',4000)  
) AS EMPLOY(NAME,DEPT,SALARY)

--LAG 和 LEAD 函数的声明，如下：LAG(表达式或字段, 偏移量, 默认值, IGNORE NULLS或RESPECT NULLS)。LAG是向下偏移，LEAD是想上偏移，大家看一下上面SQL的查询结果就一目了然了。
SELECT  
    NAME AS 姓名,  
    SALARY AS 工资,  
    LAG(SALARY,0) OVER(ORDER BY SALARY) AS LAG0,  
    LAG(SALARY) OVER(ORDER BY SALARY) AS LAG1,  
    LAG(SALARY,2) OVER(ORDER BY SALARY) AS LAG2,  
    LAG(SALARY,3,0,'IGNORE NULLS') OVER(ORDER BY SALARY) AS LAG3,  
    LAG(SALARY,4,-1,'RESPECT NULLS') OVER(ORDER BY SALARY) AS LAG4,  
    LEAD(SALARY) OVER(ORDER BY SALARY) AS LEAD  
FROM  
(  
    --姓名    部门  工资  
    VALUES  
    ('张三','市场部',2000),  
    ('赵红','技术部',2400),  
    ('李四','市场部',3000),  
    ('李白','技术部',3200),  
    ('王五','市场部',4000),  
    ('王蓝','技术部',5000)  
) AS EMPLOY(NAME,DEPT,SALARY)
/**************************** OLAP函数 End ****************************/

/**************************** 经典学生、老师、课程和成绩查询 Begin ****************************/
--经典学生、老师、课程和成绩查询
SELECT * FROM Z_STUDENT --SNO NAME AGE SEX
SELECT * FROM Z_CLASS --CNO TNO NAME
SELECT * FROM Z_SCORE --SNO CNO SCORE
SELECT * FROM Z_TEACHER --TNO NAME

--求选修所有课程的学生
SELECT *
FROM Z_STUDENT S 
WHERE S.SNO IN 
(
	SELECT R.SNO
	FROM Z_SCORE R 
	GROUP BY R.SNO
	HAVING COUNT(1) = (SELECT COUNT(1) FROM Z_CLASS)
)

--查至少选择了c01,c04两门课程编号的学生
SELECT * 
FROM Z_STUDENT S
WHERE S.SNO IN 
(
	SELECT DISTINCT R.SNO
	FROM Z_SCORE R 
	WHERE EXISTS (SELECT * FROM Z_SCORE R2 WHERE R.SNO = R2.SNO AND R2.CNO = 'c01')
		AND EXISTS (SELECT * FROM Z_SCORE R3 WHERE R.SNO = R3.SNO AND R3.CNO = 'c04')
)

--查询“c01”课程比“c04”课程成绩高的所有学生编号
SELECT T1.SNO
FROM (SELECT R.SNO, R.SCORE FROM Z_SCORE R WHERE R.CNO = 'c01') T1,
(SELECT R.SNO, R.SCORE FROM Z_SCORE R WHERE R.CNO = 'c04') T2
WHERE T1.SNO = T2.SNO AND T1.SCORE > T2.SCORE

--查询平均成绩大于60分的同学的学号和平均成绩
SELECT R.SNO, AVG(R.SCORE) AS SCORE
FROM Z_SCORE R 
GROUP BY R.SNO
HAVING AVG(R.SCORE) > 60

--查询所有同学的学号、姓名、选课数、总成绩
SELECT S.SNO, S.NAME, RR.NUM, RR.TOTAL
FROM Z_STUDENT S 
LEFT JOIN 
(
	SELECT R.SNO, COUNT(1) AS NUM, SUM(R.SCORE) AS TOTAL
	FROM Z_SCORE R 
	GROUP BY R.SNO
) RR ON S.SNO = RR.SNO

--查询各科成绩最高和最低的分：以如下形式显示：课程ID，最高分，最低分
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

--按各科平均成绩从低到高和及格率的百分数从高到低顺序 
SELECT R.CNO, MAX(C.NAME) "课程", AVG(R.SCORE) AS "平均成绩", 100 * SUM(CASE WHEN VALUE(R.SCORE, 0) >= 60 THEN 1 ELSE 0 END) / COUNT(1) AS "及格百分数" 
FROM Z_SCORE R JOIN Z_CLASS C ON R.CNO = C.CNO
GROUP BY R.CNO
ORDER BY AVG(R.SCORE) ASC, 100 * SUM(CASE WHEN VALUE(R.SCORE, 0) >= 60 THEN 1 ELSE 0 END) / COUNT(1) DESC

--统计列印各科成绩,各分数段人数:课程ID,课程名称,[100-85],[85-70],[70-60],[ <60] 
SELECT C.CNO, C.NAME, 
	SUM(CASE WHEN R.SCORE BETWEEN 85 AND 100 THEN 1 ELSE 0 END) AS "85-100", 
	SUM(CASE WHEN R.SCORE BETWEEN 70 AND 85 THEN 1 ELSE 0 END) AS "70-85",
	SUM(CASE WHEN R.SCORE BETWEEN 60 AND 70 THEN 1 ELSE 0 END) AS "60-70",
	SUM(CASE WHEN R.SCORE < 60 THEN 1 ELSE 0 END) AS "60-"
FROM Z_CLASS AS C 
	LEFT JOIN Z_SCORE R ON C.CNO = R.CNO
GROUP BY C.CNO, C.NAME

--查询各科成绩前三名的记录:(不考虑成绩并列情况)
SELECT * 
FROM Z_SCORE R 
WHERE R.SCORE IN 
(
	SELECT R2.SCORE FROM Z_SCORE R2 WHERE R.CNO = R2.CNO ORDER BY R2.SCORE DESC FETCH FIRST 3 ROWS ONLY
)
ORDER BY R.CNO

--查询两门以上不及格课程的同学的学号及其平均成绩 
SELECT R.SNO, AVG(R.SCORE) 
FROM Z_SCORE R 
WHERE R.SNO IN (SELECT R2.SNO FROM Z_SCORE R2 WHERE R2.SCORE < 60 GROUP BY R2.SNO HAVING COUNT(1) > 2)
GROUP BY R.SNO
/**************************** 经典学生、老师、课程和成绩查询 End ****************************/

--用一句SQL，生成 0~99
WITH T(ID) AS
(
	SELECT 1 AS ID FROM SYSIBM.SYSDUMMY1 A 
	UNION ALL
	SELECT ID + 1 AS ID FROM T, SYSIBM.SYSDUMMY1 A WHERE ID < 99
)
SELECT ID FROM T
