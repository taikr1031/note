db2 catalog tcpip node n_wh remote 10.69.0.8 server 50000
db2 catalog db bpfdb as bpfdb_wh at node n_wh

select * from syscat.columns  a where a.TABNAME='T_EMARKETING_ARTICLE' and a.COLNO=3
SELECT CTTCTG_ID FROM T_EMARKETING_ARTICLE a

SELECT * FROM SYSCAT.TABLES WHERE TBSPACEID = 2 AND TABLEID = 13
SELECT * FROM SYSCAT.COLUMNS WHERE  TABNAME= '*******' AND COLNO = 8  

--SQL����UUID
SELECT concat (hex (RAND ()), hex (RAND ()))  a INTO @UUID   FROM SYSIBM.SYSDUMMY1 WITH UR;

���ݿ��Ż�����д���루Q���ƣ�
NOT IN����������Ĳ��������ȵõ��Ӳ�ѯ�Ľ����Ȼ��ִ�������Ĳ�ѯ���� NOT EXISTS ǡ���෴�����������ڵĲ�����

--�Ӵ�DB2��־�ռ䣺
db2 connect to whhrdb user whhr using whhr_0804
db2 get db cfg for whhrdb
db2 update db cfg using LOGFILSIZ 10240
db2stop force
db2start
db2 get db cfg for whhrdb

DB2���õ�����

db2 ? 42703
db2 ? sql811

db2expln -d db3 -q "select dict_code from zm.t_b_dict" -t

  ./ db2icrt -a 
1���������ݿ�
db2start
2��ֹͣ���ݿ�
db2stop
3���������ݿ�
db2 connect to o_yd user db2 using pwd
4�������ݿ�����������
db2 get dbm cfg
5��д���ݿ�����������
db2 update dbm cfg using ������ ����ֵ
6�������ݿ������
db2 connect to o_yd user db2 using pwd
db2 get db cfg for o_yd
7��д���ݿ������
db2 connect to o_yd user db2 using pwd
db2 update db cfg for o_yd using ������ ����ֵ
8���ر�����Ӧ������
db2 force application all
db2 force application ID1,ID2,,,Idn MODE ASYNC
(db2 list application for db o_yd show detail)
9���������ݿ�
db2 force application all
db2 backup db o_yd to d:
(db2 initialize tape on \\.\tape0)
(db2 rewind tape on \\.\tape0)
db2 backup db o_yd to \.\tape0
10���ָ����ݿ�
db2 restore db o_yd from d: to d: 
db2 restore db o_yd from \\.\tape0 to d:
db2 restore db loc_test from d:\DB_Bak taken at 20070305145246 to d:
11���󶨴洢����
db2 connect to o_yd user db2 using pwd
db2 bind c:\dfplus.bnd
�����洢���̵��������ϵ�C:\sqllib\functionĿ¼��
12�������
db2 connect to o_yd user db2 using pwd
db2 reorg table ydd
db2 runstats on table ydd with distribution and indexes all

13������������
db2 export to c:\dftz.txt of del select * from dftz
db2 export to c:\dftz.ixf of ixf select * from dftz
14�����������
import from c:\123.txt of del insert into ylbx.czyxx

db2 import to c:\dftz.txt of del commitcount 5000 messages c:\dftz.msg insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 messages c:\dftz.msg insert into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 insert_update into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 replace into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 create into dftz (��IXF)
db2 import to c:\dftz.ixf of ixf commitcount 5000 replace_create into dftz (��IXF)

15.db2move && db2look
����DB��
		db2move dbName export -sn schemaName -tn tabName1,tabName2,tab3* -u userid -p password
		db2move whhrdb export -sn whhr -tn HR_PAY_DETAIL -u whhr -p whhr_0804
		db2look -d dbName -e -a -o db2look.sql
����DB��
		db2 create db dbName
		db2 -tvf db2look.sql
		db2move dbName import -io replace_create -u userid -p password
		db2 set integrity for prodinst.actor immediate checked --�������״̬��Ϊ����״̬
		
16��ִ��һ���������ļ�
db2 �Ctf �������ļ���
���ļ���ÿһ�������� ��������

17���Զ������������ļ�
���ı��ļ���temp.sql
select 'runstats on table DB2.' || tabname || ' with distribution and detailed indexes all;' from syscat.tables where tabschema='DB2' and type='T';
db2 �Ctf temp.sql>runstats.sql

18.��������
db2 rename table tta to rn_tab

17���Զ����ɽ�����ͼ�����
�ڷ������ϣ�C:\sqllib\miscĿ¼��
db2 connect to o_yd user db2 using pwd
db2look �Cd o_yd �Cu db2 �Ce �Cp �Cc c:\o_yd.txt

18����������
grant dbadm on database to user bb
db2icrt   ����ʵ��
db2idrop  ɾ��ʵ��
db2start  ����ʵ��
db2stop   ֹͣʵ�� 

CREATE DATABASE  testdb
( 2)  DFT_EXTENT_SZ 4
( 3)  CATALOG TABLESPACE MANAGED BY DATABASE USING
( 4)   (FILE 'C:\CAT\CATALOG.DAT' 2000, FILE 'D:\CAT\CATALOG.DAT' 2000)
( 5)    EXTENTSIZE 8
( 6)   PREFETCHSIZE 16
( 7) TEMPORARY TABLESPACE MANAGED BY SYSTEM USING
( 8)  ('C:\TEMPTS','D:\TEMPTS')
( 9) USER TABLESPACE MANAGED BY DATABASE USING
(10) (FILE 'C:\TS\USERTS.DAT' 121)
(11) EXTENTSIZE 24
(12)  PREFETCHSIZE 48 

20. db2look �Cd ylbx �Cu db2admin �Cw �Casd �Ca �Ce �Co a.txt
db2look -d rone -i db2admin -w db2admin -l -m  -e -a -o rone.sql
21. ��ʾ��ǰ�û����б� 
����list tables 
22.�г����е�ϵͳ�� 
����list tables for system
23.�鿴��ṹ 
����db2 describe select * from user.tables


24.��Ŀ���ݿ�
db2 catalog tcpip node local remote ���ݿ�IP server 50000
db2 catalog db ���ݿ��� as ���ݿ���� at node local

db2 catalog tcpip node n_itil remote 10.68.18.55 server 50000
db2 catalog db ITIL as ITIL at node n_itil

move������Ľű���
db2move whbpf export -tn t_b_cig_sale_info -u hbyc -p hbyc >whbpf23.log
db2move whywtest import -io replace_create -u db2admin -p db2admin >whbpfdb23.log
db2move mydb import -io replace_create -u db2admin -p db2admin


TO_CHAR (timestamp_expression_r,'YYY-MM-DD HH24:MI:SS')
TO_DATE (string_expression_r, 'YYY-MM-DD HH24:MI:SS')

-----���ݿ����ܼ��--------
topas
shift+`�л�
��l��cpu����ͼ

-------IBM��¼------------------
����IBM���Է����� �� http://172.16.50.20 114201010320 1
db2ִ�мƻ����� ��Ҫ��һ�ױ�
���ݿ⣺172.16.50.22 hbyc 1

----vi�÷�------------
vi �ļ��� ����vi��
:q! �˳�

---db2top�÷�---------------------
db2top -d bpfdb -u hbyc -p 1
��D�����붯̬sql���
��z����������
�����е����ݣ�����Ǵ�0��ʼ
��L������sql�����кţ��鿴sql��ϸ



----------����-------------------
 load client from c:\ftp\null.txt of del terminate into hbyc.T_B_CLIENT
 reorg table [table] ͨ���ع�������������Ƭ�����ݲ�ѹ����Ϣ���Ա�������顣
 runstats on table [table] �ռ��� ��ͳ����Ϣ��
 SET INTEGRITY FOR [table] IMMEDIATE CHECKED 
 SET INTEGRITY FOR temp_test IMMEDIATE CHECKED 
 
 ----crontab -e����---------------
 i ��ʼ����
 ��������д�롣
 �������˳�
 
 ----�鿴��ռ��С----------
 list tablespaces show detail
 
 ------��Ŀ---------------
db2 catalog tcpip node nd34122 remote 10.68.34.122 server 50000
db2 catalog db HBYC as HBYC122 at node nd34122

db2 catalog tcpip node nd117 remote 10.68.50.117 server 50000
db2 catalog db hbdc as dc117 at node nd117

db2 catalog tcpip node nd123 remote 10.68.0.123 server 50000
db2 catalog db hbdc as dc123 at node nd123

db2 catalog tcpip node ndibm2 remote 172.16.50.21 server 50000
db2 catalog db bpfdb as ibm2bpf at node ndibm2
  
db2 catalog tcpip node ndlocal remote 127.0.0.1 server 50000
db2 catalog db platform as platform at node ndlocal

 ----��Ŀ----------------
 --�鿴���б�Ŀ��Ϣ
 list db directory
 --ע��ڵ� 
 db2 catalog tcpip node WLTDB remote 10.69.0.20 server 50000
 --ע�����ݿ� 
 db2 catalog database BPFDB as WLTDB at node WLTDB
 --ɾ��ע��ڵ� 
db2 uncatalog node nd117
 --ɾ��ע�����ݿ� 
db2 uncatalog database dc117
 
 -------------------------
 ----����ṹ--------------------
 db2look -d dbname -e -z schema_name -i userid -w password -o C:/out.sql
 
 db2look -d whiso -e -z essp -i essp -w essp-o C:/out.sql
 
 
 db2move WHISO EXPORT -tn jbpm_* -u essp -p essp
 ----�½��洢����-----------------
 1��
 
 db2cmd db2 connect to hbdc_new user hbdc using hbdc232
 db2cmd db2 connect to hbdc user dc using hbdc213
 2��
 cd E:\����\SVN\�������Ĵ洢����\procedure\application
 cd E:\����\SVN\�������Ĵ洢����\procedure-datacenter(province)
 db2  -td@ -vf P_A_CORP_ANALYSE_ORDER.sql
 db2  -td@ -vf P_A_CIG_RATE.sql
 
 
 E:
 cd E:\����\SVN\�������Ĵ洢����\117hbdc
 db2cmd db2 connect to hbdc_NEW user hbdc using hbdc232
 db2 -td@ -vf P_B_LOAD.SQL
 
 db2cmd db2 connect to hbdc user ds using 123
 db2 -td@ -vf P_SYNC_TO_APP.SQL
 db2cmd db2 connect to tszdc user hbdc using hbdc
 db2 -td@ -vf PROC_TEST.sql 
 ------�洢����ģ��--------------------------
DROP SPECIFIC PROCEDURE PROC_TEST
@

CREATE PROCEDURE PROC_TEST(
		IN IN_CORPCODE CHARACTER(8)
	)
SPECIFIC P_T
MODIFIES SQL DATA
LANGUAGE SQL
BEGIN

END
@
 -------117С���ı�Ŀ��Ϣ------------------
 HBYC����123��HBDC���ݿ�
 YANYEDB������Ҷʡ��˾��DB2���ݿ⣬���չ���Ϣ
 ------------------------------------------
 db2 force application all
 
 db2start
 
 db2stop
 ------------------------------------
 �������ݿ�
 db2 force application all
 db2 backup db o_yd to d:
 db2 backup db gisdb to \gisdb_bak
 (db2 initialize tape on \\.\tape0)
 (db2 rewind tape on \\.\tape0)
 db2 backup db o_yd to \.\tape0
 db2 backup db netdb to /backup
 db2 backup db testdb to /data/bak
 �ָ����ݿ�
 db2 restore db o_yd from d: to d: 
 db2 restore db o_yd from \\.\tape0 to d:
 ---------------
 --------�鿴��ռ�ṹ---------
 connect to szdc
 list tablespaces show detail
 ----------
 
 db2 restore db szdc from /data/bak to /data/database
 db2 RESTORE DATABASE SZDC FROM /data/database/bak TAKEN AT 20100825034006 TO /data/database
 
 db2 restore db netdb from /  to /data/database
 ----------------����---------------------------------------------
 db2 "create database gisdb on /data/database/gisdb/ \
         using codeset GBK territory CN pagesize 32 k \
     catalog tablespace \
         managed by system using ('/data/database/gisdb/catp') \
         extentsize 32 prefetchsize 128 \
     user tablespace \
         managed by system using('/data/database/gisdb/ustp') \
         extentsize 32 prefetchsize 128 \
     temporary tablespace \
         managed by system using('/data/database/gisdb/tmtp') \
         extentsize 32 prefetchsize 128"
 -------------------------------------------------
 
 ----------Զ����ͼ-------------------------------
 1������ҵ�����ݿ⣬�����ݿ������������(federated)����
         db2
         db2 =>update dbm cfg using federated YES
         db2 =>db2stop force
         db2 =>db2start
 
 2.��Ŀҵ��ڵ��BPFDB���ݿ�,����ȷ��ͨ��list node directory �鿴��������轨����
         db2 =>catalog tcpip node nodebpf remote ҵ�����ݿ�IP server 50000
         db2 =>catalog db BPFDB at node nodebpf
 
 3.��½�������ݿ�GISDB
         db2 =>connect to ����DB user hbyc using ***
 
 4.����db2(drda)��װ��
         db2 =>create wrapper drda
 
 5.����Զ�̷�����(svr_business)ָ��Զ�̵�����Դ(BPFDB)��ͬʱָ��Զ�̵���֤��Ϣ(user:hbyc pwd:***)����½�����뼰���ݿ�汾����ʵ���޸�
 db2 => create server svr_business type db2/aix version 8.2 wrapper drda authorization "hbyc" password "xgyc090919" options(dbname 'bpfdb')
 create server svr_net1 type db2/aix version 8.2 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_net_win8 type db2/nt version 8 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_whbpf type db2/nt version 8 wrapper drda authorization "hbyc" password "hbyc" options(dbname 'whbpf')
 
 6.���������û���Զ�̵�½��ӳ�䣬��½���������ʵ���޸�
 db2 =>create user mapping for "JCZH" server svr_whbpf options (remote_authid 'hbyc', remote_password 'hbyc')
 
 7.�ñ��ص�½�û�(hbyc)���µ�½�����⣬����Զ�̱���ǳ�(Զ����ͼ)��������ִ�У�
 CREATE NICKNAME HBYC.T_B_EMPLOYEE_LNK FOR SVR_BUSINESS.HBYC.T_B_EMPLOYEE
 CREATE NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
   FOR "SVR_NET_WIN8"."DB2ADMIN"."T_TERMINAL_CLIENT_STORAGE";
   
 CREATE NICKNAME HBYC.T_B_CORP_LNK FOR SVR_BUSINESS.HBYC.T_B_CORP
 ����һ���ֵ��Զ����ͼ
 CREATE NICKNAME HBYC.T_B_DICT_LNK FOR SVR_123_HBDC.HBYC.T_B_DICT
 CREATE NICKNAME HBDC.T_K_CS_BSS_WEEK_CORP_CIG_LNK FOR SVR_123_HBDC.HBDC.T_K_CS_BSS_WEEK_CORP_CIG
 8.���������� ���� T_B_CORP_LNK �� T_B_EMPLOYEE_LNK �����Ƿ����ɹ�
 
 -----------drop---------------
 DROP SERVER server_name
   DROP USER MAPPING FOR authorization_name SERVER server_name
   DROP NICKNAME nickname
   DROP WRAPPER wrapper_name
   DROP NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
 -------------------------------------------------
 
 --------sql����----------------------------------
 ����2λС�� CAST(t12.SELL_AMOUNT as DECIMAL(25, 2))
 -------------------------------------------------
 
 
 ---------����---------------------------------------
 db2 export to \data\ttt.txt of del select * from SDE.GCDRULES
 db2 export to \t_b_sell_20111229.txt of del select * from dc.t_b_sell
 
 db2 export to \db2data\hbyc_t_b_client.txt of del select * from hbyc.t_b_client
 db2 export to c:\t_b_sell.txt of del select * from t_b_sell fetch first 200000 rows only
 
 db2 export to c:\T_B_ORDER.txt of del select * from t_terminal_callout
 db2 export to c:\T_B_ORDER_DETAIL.txt of del select * from t_terminal_callout_cig
 db2 load from t_b_sell.txt of del insert into t_b_sell
 db2 load client from C:\FTP\t_b_client.txt of del insert into HBYC.T_B_CLIENT
 db2 load client from c:\T_B_ORDER_DETAIL.txt of del insert into T_B_ORDER_DETAIL
 
 load ������RESTART INTO insert into terminate into
 db2 load client from c:\null.txt of del terminate into T_B_SYSPARAM
 db2 LOAD FROM  "e:\etlApp\upload/11421001/gxc2/T_B_CORP.txt" OF DEL RESTART INTO T_B_CORP;
 LOAD client FROM  "E:\db2data\T_B_EMPLOYEE.del" OF DEL RESTART INTO T_B_EMPLOYEE
 
 connect to hbdc user hbdc using hbdc123
 load CLIENT from E:\etlApp\exportdata\restore\t_b_buy_test_restore.del of del insert into t_b_buy_test_restore
 
 LOAD CLIENT FROM  "E:\etlApp\dataExport\t_b_corp_test.del" OF DEL INSERT INTO t_b_corp_test NONRECOVERABLE
 ---------------------------------------------------
 
 
 (��������Ҫ�ڱ���ִ��)
 db2 load from null.txt of del terminate into T_K_CS_MONTH_TOTAL_MPC
 load client from c:\null.txt of del terminate into essp_em_event
 ------------------------------
 ----��ѯ�������-----------
 db2 ? 22001 ���Կ� DB2 �� STATE ���͡�
 db2cmd -c -w -i db2 ? sql20076 ���Կ�SQLCODE�Ľ��͡�
 -----------------------------
 
 ������
 db2 export to 't_f_cig_month_sale.del' of del  select * from t_f_cig_month_sale
 
 db2 export to 'c:\sj.del' of del SELECT t.C_SJRQ,substr(t.C_DWDM,1,2) dw,t.Y_LXDM,t.Y_DBMC,t.Y_BWDM,sum(t.S_SGSL) sl,sum(t.S_SGJE) je FROM YY_SG.SGSJ t group by t.C_SJRQ,substr(t.C_DWDM,1,2),t.Y_LXDM,t.Y_DBMC,t.Y_BWDM
 
 ���룺
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL MODIFIED BY  COMPOUND=5 COMMITCOUNT 1000 insert into t_f_cig_month_sale
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL insert into t_f_cig_month_sale
 db2 IMPORT FROM 'E:\etlApp\exportdata\restore\t_b_buy_test_restore.del' OF DEL insert into t_b_buy_test_restore_bak
 ------------------------------
 
 --------���
DatabaseMetaData.getTables����ʱ���׳������µ��쳣��Ϣ: 
COM.ibm.db2.jdbc.DB2Exception:   [IBM][CLI Driver][DB2/AIX64]   SQL0443N     ����   "SYSIBM.SQLTABLES "���ض�����   "TABLES "�������˴�����ı�   "SYSIBM:CLI:-805 "   �Ĵ���   SQLSTATE��     SQLSTATE=38553 

db2 terminate
db2 CONNECT TO <dbname>
db2 BIND <path>/db2schema.bnd BLOCKING ALL GRANT PUBLIC sqlerror continue
db2 terminate
 
--�洢������ͨ��Ԥ������ö�̬����
declare @ls_call_sql varchar(100) default 'call #allot_proc_name(?, ?, ?, ?, ?)';
--������Ӧ�������
set @ls_allot_proc_name = (select p_value from t_st_parameter where p_name = 'curr_in_allot_proc');
set @ls_call_sql = replace(@ls_call_sql, '#allot_proc_name', @ls_allot_proc_name);

prepare s1 from @ls_call_sql;
execute s1 into @os_errmsg using @in_in_no, @is_cig_code, @in_in_qty, @in_unit_code;
get diagnostics @ln_call_rtn = DB2_RETURN_STATUS;
if @ln_call_rtn <> 0 then
    return @ln_call_rtn;
end if;

/********************����WAS��DB2����*******************************/
����WAS:
cd /home/db2admin/sqllib
. ./db2profile

cd /usr/IBM/WebSphere/AppServer/profiles/Dmgr01/bin
./startManager.sh

cd /usr/IBM/WebSphere/AppServer/profiles/AppSrv01/bin
./startNode.sh


�������ݿ�ű���
db2 "create database bpfdb on /data/database/bpfdb/ \
        using codeset GBK territory CN pagesize 32 k \
    catalog tablespace \
        managed by system using ('/data/database/bpfdb/catp') \
        extentsize 32 prefetchsize 128 \
    user tablespace \
        managed by system using('/data/database/bpfdb/ustp') \
        extentsize 32 prefetchsize 128 \
    temporary tablespace \
        managed by system using('/data/database/bpfdb/tmtp') \
        extentsize 32 prefetchsize 128"
		
db2 force applicaton all
db2 backup db bpfdb to /data/database/backup


��restore���������Ҫ��DB2ADMIN������������ݿⰡ��������WHICSS
db2 connect to bpfdb
û�н���ֱ�ӻָ����ݿ⣺
db2 restore db bpfdb from /tmp taken at 20071009202144
�����ݿ��Ѿ����ڣ��ָ������ݿ⣺
db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing

db2 restore db bpfdb from /tmp taken at 200710092002144 into bpfdb
DB2ʵ��������·����ͬ����Ҫ�ض���ָ���
db2 restore db bpfdb from /tmp taken at 20071009202144 into bpfdb redirect without rolling forward
db2 "set tablespace containers for 0 using (path "/data/database/bpfdb/catp")"
db2 "set tablespace containers for 1 using (path "/data/database/bpfdb/tmtp")"
db2 "set tablespace containers for 2 using (path "/data/database/bpfdb/ustp")"
db2 "set tablespace containers for 3 using (path "/data/database/bpfdb/utmtp")"
db2 "set tablespace containers for 4 using (path "/data/database/bpfdb/tlstp")" 
db2 restore db bpfdb continue 

������ݿ�ָ�������������ɾ�����ݿ⣬�ٻָ���
db2 drop database bpfdb
���ݿ�ɾ����һ�µ�5������Ŀ¼Ӧ�û��Զ�ɾ�������û���Զ�ɾ������ִ������5���������Ѿ��Զ�ɾ���ˣ�����������5������
db2untag -f /data/database/catp
db2untag -f /data/database/tmtp
db2untag -f /data/database/ustp
db2untag -f /data/database/utmtp
db2untag -f /data/database/tlstp
db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing


�鿴��ǰ��½�û���
whoami
/********************����WAS��DB2����*******************************/


C:\>db2cmd

C:\>set db2instance=rone
C:\>db2start

C:\>db2 terminate
C:\>db2stop
--ǿ��ֹͣ
C:\>db2stop force

C:\>db2 list application

--�������ݿ�
C:\>db2 connect to rone

--ִ��SQL���,��������ʾ
C:\>db2 "select * from db2admin.ro_code_city" | more

���ݿ�ָ�����:
db2 restore db sample from D:\DB2Backups taken at 20010320122644

--��ʾ�������ݿ���Ϣ
C:\>db2 list db directory

--���ı��ļ����
tail -100 SystemOut.log

/************************ ����/�ָ�*********************************************
su - db2admin
db2 connect to jzdc usre db2admin using db2admin
db2 force applications all
db2 backup db ldapdb2 to /temp/backup
db2stop force
db2start

db2 backup db ldapdb2 to directory_or_device
db2 restore db ldapdb2 from /temp/backup replace existing
���� /temp/backup �Ǵ洢���ݵ�Ŀ¼���豸�����ơ�

1.BACKUP
C:\>db2 backup db rone user db2admin using db2admin to e:

���ݳɹ����˱���ӳ���ʱ������ǣ�20060421110354

2.RESTORE:
C:\>db2 restore db rone from e taken at 20060421110354 to e redirect
SQL1035N  ��ǰ����ʹ�����ݿ⡣  SQLSTATE=57019

C:\>db2 restore db rone from e taken at 20060421110354 to e redirect
SQL2539W  ���棡���ڸ�ԭ���뱸��ӳ�����ݿ���ͬ���������ݿ⡣���ݿ��ļ�����ɾ����

��Ҫ�����𣿣�y/n�� y
SQL1277N  ��ԭ�Ѽ�⵽һ��������ռ������ǲ��ɷ��ʵģ������ѽ����ǵ�״̬����Ϊ

�����붨��洢������
DB20000I  RESTORE DATABASE ����ɹ���ɡ�

C:\>db2 list tablespaces show detail

           ��ǰ���ݿ�ı�ռ�

 ��ռ��ʶ                        = 0
 ����                              = SYSCATSPACE
 ����                              = ϵͳ����ռ�
 ����                              = �κ�����
 ״̬                              = 0x2000100
   ��ϸ���ͣ�
     ��ԭ�ݹ�
     ���Զ���洢��

 ��ռ��ʶ                        = 1
 ����                              = TEMPSPACE1
 ����                              = ϵͳ����ռ�
 ����                              = ϵͳ��ʱ����
 ״̬                              = 0x2000100
   ��ϸ���ͣ�
     ��ԭ�ݹ�
     ���Զ���洢��

 ��ռ��ʶ                        = 2
 ����                              = USERSPACE1
 ����                              = ϵͳ����ռ�
 ����                              = �κ�����
 ״̬                              = 0x2000100
   ��ϸ���ͣ�
     ��ԭ�ݹ�
     ���Զ���洢��

 ��ռ��ʶ                        = 3
 ����                              = SYSTOOLSPACE
 ����                              = ϵͳ����ռ�
 ����                              = �κ�����
 ״̬                              = 0x2000100
   ��ϸ���ͣ�
     ��ԭ�ݹ�
     ���Զ���洢��

SQL1350N  Ӧ�ó���δ������ȷ״̬�����ܴ��������ԭ���� = "3"��

C:\>DB2 SET TABLESPACE CONTAINERS FOR 0 USING(PATH 'E:\ts0con1')
DB20000I  SET TABLESPACE CONTAINERS ����ɹ���ɡ�

C:\>DB2 SET TABLESPACE CONTAINERS FOR 1 USING(PATH 'E:\ts1con1')
DB20000I  SET TABLESPACE CONTAINERS ����ɹ���ɡ�

C:\>DB2 SET TABLESPACE CONTAINERS FOR 2 USING(PATH 'E:\ts2con1')
DB20000I  SET TABLESPACE CONTAINERS ����ɹ���ɡ�

C:\>DB2 SET TABLESPACE CONTAINERS FOR 3 USING(PATH 'E:\ts3con1')
DB20000I  SET TABLESPACE CONTAINERS ����ɹ���ɡ�

C:\>db2 restore db rone continue
DB20000I  RESTORE DATABASE ����ɹ���ɡ�
**********************************************************************************/

--��ʾ���������ݿ�ı��ݼ�¼
C:\>Db2 list history backup all for rone



db2 restore db sample from D:\DB2Backups taken at 20010320122644
 ϵͳ���ݿ�Ŀ¼

 Ŀ¼�е���Ŀ�� = 1

���ݿ� 1 ��Ŀ��

 ���ݿ����                      = TOOLSDB
 ���ݿ�����                      = TOOLSDB
 ���ݿ�������                    = C:\DB2
 ���ݿⷢ�а漶��                = a.00
 ע��                            =
 Ŀ¼��Ŀ����                    = ���
 Ŀ¼���ݿ������                = 0
 ���÷�����������                =
 ���÷������˿ں�                =
 
 
**********************�� DB2 �ͻ������ӵ� DB2 Linux/Unix/Windows ������***************************
 C:\>db2 list node directory
SQL1027N  �Ҳ����ڵ�Ŀ¼��

C:\>db2 catalog tcpip node db9 remote 10.68.19.9 server 50000
DB20000I  CATALOG TCPIP NODE ����ɹ���ɡ�
DB21056W  ֻ����ˢ��Ŀ¼���ٻ����Ժ�Ŀ¼���ĲŻ���Ч��

C:\>db2 catalog db rone as rone1 at node db9
DB20000I  CATALOG DATABASE ����ɹ���ɡ�
DB21056W  ֻ����ˢ��Ŀ¼���ٻ����Ժ�Ŀ¼���ĲŻ���Ч��

C:\>db2 terminate
DB20000I  TERMINATE ����ɹ���ɡ�

C:\>db2 connect to rone1 user dc using 123
***************************************************************************************************
C:\>db2 create db rone
DB20000I  CREATE DATABASE ����ɹ���ɡ�

************************************************�ƶ����ݿ�(db2move)********************************
D:\rone_back>db2look -d toolsdb -e  -l -f -o toolsdb.sql

�������ݿ�(D:\rone_back ���ݿ��ƶ��ļ�����Ŀ¼)
D:\rone_back>db2move rone1 export -u dc -p 123

db2move ez-bpfdb export -sn hbyc -tn t_s_p_*,t_b_employee,t_b_dict,t_b_corp,t_cc_* -u whyc -p 1

��DBA���߽�һ���¿�(Ŀ���:sample)
��DBA���ߵ���Դ��(rone1)�Ľ���̱�(rone1 ->  ����Ҽ�-> Extract)
��Դ��Ľ���ű���Ŀ���ִ��,��Դ��ı�������Ķ���ȫ������

��ָ�����û���ʶ�������� REPLACE ��ʽ���� sample ���ݿ��е����б�
D:\rone_back>db2move sample import -io replace_create -u userid -p password

������������������ REPLACE ��ʽװ�� db2admin �� db2user ģʽ�µ����б�
D:\rone_back>db2move sample load -sn db2admin, db2user -lo REPLACE

ֻ�����ֱ�
db2move jmdc export -tn T_B_C*,T_B_D*,T_B_E*,T_B_L*,T_B_P*,T_B_SA*,T_B_Y* -u dc -p 123 

G:\DB>db2move ez_bpfdb export -sn hbyc -tn t_s_p_*,t_cc_*,t_b_employee,t_b_corp,t_b_dict,t_b_dict_index,t_b_line,t_b_modify_index,t_b_client_deliver,t_b_client_manage,t_b_client_market,t_b_client_regie,t_b_client_system -u hbyc -p ezyc100315
****************************************************************************************************

ȡ�����ݿ��Ŀ��
C:\>db2 uncatalog db complain
DB20000I  UNCATALOG DATABASE ����ɹ���ɡ�
DB21056W  ֻ����ˢ��Ŀ¼���ٻ����Ժ�Ŀ¼���ĲŻ���Ч��
db2move bpfdb_sz export -sn db2admin -tn t_eval_*,t_act_*,t_s_p_*,t_b_employee,t_b_corp -u hbyc -p szyc1019


db2move bpfdb_sz export -sn hbyc -tn t_eval_*,t_act_*,t_s_p_r*,t_b_employee,t_b_corp,t_b_dict,t_b_dict_index,t_b_line,t_b_modify_index,t_b_client_deliver,t_b_client_manage,t_b_client_market,t_b_client_regie,t_b_client_system -u hbyc -p szyc1019



���¶�һ���Ѿ����ڵģ��ѱ�Ŀ�����ݿ��ٴα�Ŀ��
C:\>db2 catalog db hbdc as com_zm at node db4
DB20000I  CATALOG DATABASE ����ɹ���ɡ�
DB21056W  ֻ����ˢ��Ŀ¼���ٻ����Ժ�Ŀ¼���ĲŻ���Ч��

��һ�����ݿ����ж���û�����һ���û���½��
C:\>db2 connect to com_zm user complain using 123

���ִ��DB2�Ľű��ļ�? 
D:\>db2 -vtf rone.sql

DB2����ORACLE��ROWNUM()��? 
	select NAME,TBNAME,ROW_NUMBER()OVER() from sysibm.SYSCOLUMNS WHERE TBNAME='RO_PERSON' 

���ȡ��ǰʱ��? 
SELECT CURRENT TIMESTAMP FROM SYSIBM.SYSDUMMY1

DB2���ں�����
select current date + 3 YEARS + 2 MONTHS + 15 DAYS  from sysibm.sysdummy1
	
�����ݱ���ȡָ��ǰ������¼ 
select  *  from tb_market_code fetch first 1 rows only 

Ԥ���ֶο�ֵ�Ĵ��� 
SELECT DEPTNO ,DEPTNAME ,COALESCE(MGRNO ,'ABSENT'),ADMRDEPT 
FROM DEPARTMENT 
   COALESCE��������()�б��ʽ�б��е�һ����Ϊ�յı��ʽ�����Դ�������ʽ�� 
   ��oracle��isnull���ƣ���isnull����ֻ���������ʽ��
   
���֪������ֶε�״��:
select * from sysibm.SYSCOLUMNS WHERE TBNAME='RO_PERSON' 

C:\>db2 catalog tcpip node aix123 remote 10.68.0.123 server 50000
DB20000I  CATALOG TCPIP NODE ����ɹ���ɡ�
DB21056W  ֻ����ˢ��Ŀ¼���ٻ����Ժ�Ŀ¼���ĲŻ���Ч��

C:\>db2 catalog database hbdc as hbdc at node aix123
DB20000I  CATALOG DATABASE ����ɹ���ɡ�
DB21056W  ֻ����ˢ��Ŀ¼���ٻ����Ժ�Ŀ¼���ĲŻ���Ч��

C:\>ping 10.68.0.123


java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String todayStr = sf.format(new Date()); 



ALTER TABLE COMPLAIN.T_RECEIVE
  ADD PRIMARY KEY
   (RECEIVE_CODE
   );
#SYNC 10;

������ת��Ϊdecimal���ɣ�    
  select   cast(col1   as   decimal(20,4))/cast(col2   as   decimal(20,4))   as   result   from   table1 

--�жϴ��� t_cc_order ���� t_cc_bank_check_indexû�еļ�¼��
select order_id from 
(select order_id from t_cc_order 
    where order_date='2006-11-16' and 
    bal_mode_code='20' and 
    bal_status = '1' and 
    dis_status = '1' and 
    big_deliver_line = '11420801001'
) a except all select order_id from t_cc_bank_check_index b

select order_id from t_cc_bank_check_index b
except all select order_id from
(select order_id from t_cc_order 
    where order_date='2006-11-16' and 
    bal_mode_code='20' and 
    bal_status = '1' and 
    dis_status = '1' and 
    big_deliver_line = '11420801001'
) a


--�г� t_cc_bank_check_index �����ظ��ļ�¼��
SELECT COUNT(*),order_id FROM t_cc_bank_check_index GROUP BY order_id HAVING COUNT(*)>1

��ѯ��ǰʱ�䣬��ǰ���ڣ�
select order_id ,current time,current date from t_cc_order

from Ŀ¼ taken at xxxxx replace existing 

db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing

db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing��������������replace existing�����Ҫ��Ҫ�� 

db2 restore db bpfdb from /tmp taken at 200710092002144 into bpfdb  

-----���ݿ����ܼ��--------
topas
shift+`�л�
��l��cpu����ͼ

-------IBM��¼------------------
����IBM���Է����� �� http://172.16.50.20 114201010320 1
db2ִ�мƻ����� ��Ҫ��һ�ױ�
���ݿ⣺172.16.50.22 hbyc 1

----vi�÷�------------
vi �ļ��� ����vi��
:q! �˳�

---db2top�÷�---------------------
db2top -d bpfdb -u hbyc -p 1
��D�����붯̬sql���
��z����������
�����е����ݣ�����Ǵ�0��ʼ
��L������sql�����кţ��鿴sql��ϸ

-----�洢����ִ�й������Ǳ���---------
declare @ls_call_sql varchar(100) default 'call #allot_proc_name(?, ?, ?, ?, ?)';
    --������Ӧ�������
    set @ls_allot_proc_name = (select p_value from t_st_parameter where p_name = 'curr_in_allot_proc');
    set @ls_call_sql = replace(@ls_call_sql, '#allot_proc_name', @ls_allot_proc_name);

    prepare s1 from @ls_call_sql;
    execute s1 into @os_errmsg using @in_in_no, @is_cig_code, @in_in_qty, @in_unit_code;
    get diagnostics @ln_call_rtn = DB2_RETURN_STATUS;
    if @ln_call_rtn <> 0 then
        return @ln_call_rtn;
    end if;



----------����-------------------
 load client from c:\ftp\null.txt of del terminate into hbyc.T_B_CLIENT
 reorg table [table] ͨ���ع�������������Ƭ�����ݲ�ѹ����Ϣ���Ա�������顣
 runstats on table [table] �ռ��� ��ͳ����Ϣ��
 SET INTEGRITY FOR [table] IMMEDIATE CHECKED 
 SET INTEGRITY FOR temp_test IMMEDIATE CHECKED 
 
 ----crontab -e����---------------
 i ��ʼ����
 ��������д�롣
 �������˳�
 
 ----�鿴��ռ��С----------
 list tablespaces show detail
 
 ------��Ŀ---------------
db2 catalog tcpip node nd34122 remote 10.68.34.122 server 50000
db2 catalog db HBYC as HBYC122 at node nd34122

db2 catalog tcpip node nd117 remote 10.68.50.117 server 50000
db2 catalog db hbdc as dc117 at node nd117

db2 catalog tcpip node nd123 remote 10.68.0.123 server 50000
db2 catalog db hbdc as dc123 at node nd123

db2 catalog tcpip node ndibm2 remote 172.16.50.21 server 50000
db2 catalog db bpfdb as ibm2bpf at node ndibm2
  
db2 catalog tcpip node ndlocal remote 127.0.0.1 server 50000
db2 catalog db platform as platform at node ndlocal

 ----��Ŀ----------------
 --�鿴���б�Ŀ��Ϣ
 list db directory
 --ע��ڵ� 
 db2 catalog tcpip node YANYEDB remote 10.68.0.131 server 50000
 --ע�����ݿ� 
 db2 catalog database yanyedb as YANYEDB at node YANYEDB
 --ɾ��ע��ڵ� 
db2 uncatalog node nd117
 --ɾ��ע�����ݿ� 
db2 uncatalog database dc117
 
 -------------------------
 ----����ṹ--------------------
 db2look -d dbname -e -z schema_name -i userid -w password -o C:/out.sql
 
 db2look -d whiso -e -z essp -i essp -w essp-o C:/out.sql
 
 db2move WHISO EXPORT -tn jbpm_* -u essp -p essp
 ----�½��洢����-----------------
 1��
 db2cmd db2 connect to WHBPFTST user HBYC using 123
 db2cmd db2 connect to hbdc_new user hbdc using hbdc232
 db2cmd db2 connect to hbdc user dc using hbdc213
 2��
 cd E:\����\SVN\�������Ĵ洢����\procedure\application
 cd E:\����\SVN\�������Ĵ洢����\procedure-datacenter(province)
 db2  -td@ -vf P_A_CORP_ANALYSE_ORDER.sql
 db2  -td@ -vf P_A_CIG_RATE.sql
 
------�����е��ö�̬����------------
declare @ls_call_sql varchar(100) default 'call #allot_proc_name(?, ?, ?, ?, ?)';
    --������Ӧ�������
    set @ls_allot_proc_name = (select p_value from t_st_parameter where p_name = 'curr_in_allot_proc');
    set @ls_call_sql = replace(@ls_call_sql, '#allot_proc_name', @ls_allot_proc_name);

    prepare s1 from @ls_call_sql;
    execute s1 into @os_errmsg using @in_in_no, @is_cig_code, @in_in_qty, @in_unit_code;
    get diagnostics @ln_call_rtn = DB2_RETURN_STATUS;
    if @ln_call_rtn <> 0 then
        return @ln_call_rtn;
    end if;
 
 E:
 cd E:\����\SVN\�������Ĵ洢����\117hbdc
 db2cmd db2 connect to hbdc_NEW user hbdc using hbdc232
 db2 -td@ -vf P_B_LOAD.SQL
 
 db2cmd db2 connect to hbdc user ds using 123
 db2 -td@ -vf P_SYNC_TO_APP.SQL
 db2cmd db2 connect to tszdc user hbdc using hbdc
 db2 -td@ -vf PROC_TEST.sql 
 ------�洢����ģ��--------------------------
DROP SPECIFIC PROCEDURE PROC_TEST
@

CREATE PROCEDURE PROC_TEST(
		IN IN_CORPCODE CHARACTER(8)
	)
SPECIFIC P_T
MODIFIES SQL DATA
LANGUAGE SQL
BEGIN

END
@
 -------117С���ı�Ŀ��Ϣ------------------
 HBYC����123��HBDC���ݿ�
 YANYEDB������Ҷʡ��˾��DB2���ݿ⣬���չ���Ϣ
 ------------------------------------------
 db2 force application all
 
 db2start
 
 db2stop
 ------------------------------------
 �������ݿ�
 db2 force application all
 db2 backup db o_yd to d:
 db2 backup db gisdb to \gisdb_bak
 (db2 initialize tape on \\.\tape0)
 (db2 rewind tape on \\.\tape0)
 db2 backup db o_yd to \.\tape0
 db2 backup db netdb to /backup
 db2 backup db testdb to /data/bak
 �ָ����ݿ�
 db2 restore db o_yd from d: to d: 
 db2 restore db o_yd from \\.\tape0 to d:
 ---------------
 --------�鿴��ռ�ṹ---------
 connect to szdc
 list tablespaces show detail
 ----------
 
 db2 restore db szdc from /data/bak to /data/database
 db2 RESTORE DATABASE SZDC FROM /data/database/bak TAKEN AT 20100825034006 TO /data/database
 
 db2 restore db netdb from /  to /data/database
 ----------------����---------------------------------------------
 db2 "create database gisdb on /data/database/gisdb/ \
         using codeset GBK territory CN pagesize 32 k \
     catalog tablespace \
         managed by system using ('/data/database/gisdb/catp') \
         extentsize 32 prefetchsize 128 \
     user tablespace \
         managed by system using('/data/database/gisdb/ustp') \
         extentsize 32 prefetchsize 128 \
     temporary tablespace \
         managed by system using('/data/database/gisdb/tmtp') \
         extentsize 32 prefetchsize 128"
 -------------------------------------------------
 
 ----------Զ����ͼ-------------------------------
 1������ҵ�����ݿ⣬�����ݿ������������(federated)����
         db2
         db2 =>update dbm cfg using federated YES
         db2 =>db2stop force
         db2 =>db2start
 
 2.��Ŀҵ��ڵ��BPFDB���ݿ�,����ȷ��ͨ��list node directory �鿴��������轨����
         db2 =>catalog tcpip node nodebpf remote ҵ�����ݿ�IP server 50000
         db2 =>catalog db BPFDB at node nodebpf
 
 3.��½�������ݿ�GISDB
         db2 =>connect to ����DB user hbyc using ***
 
 4.����db2(drda)��װ��
         db2 =>create wrapper drda
 
 5.����Զ�̷�����(svr_business)ָ��Զ�̵�����Դ(BPFDB)��ͬʱָ��Զ�̵���֤��Ϣ(user:hbyc pwd:***)����½�����뼰���ݿ�汾����ʵ���޸�
 db2 => create server svr_business type db2/aix version 8.2 wrapper drda authorization "hbyc" password "xgyc090919" options(dbname 'bpfdb')
 create server svr_net1 type db2/aix version 8.2 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_net_win8 type db2/nt version 8 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_whbpf type db2/nt version 8 wrapper drda authorization "hbyc" password "hbyc" options(dbname 'whbpf')
 
 6.���������û���Զ�̵�½��ӳ�䣬��½���������ʵ���޸�
 db2 =>create user mapping for "JCZH" server svr_whbpf options (remote_authid 'hbyc', remote_password 'hbyc')
 
 7.�ñ��ص�½�û�(hbyc)���µ�½�����⣬����Զ�̱���ǳ�(Զ����ͼ)��������ִ�У�
 CREATE NICKNAME HBYC.T_B_EMPLOYEE_LNK FOR SVR_BUSINESS.HBYC.T_B_EMPLOYEE
 CREATE NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
   FOR "SVR_NET_WIN8"."DB2ADMIN"."T_TERMINAL_CLIENT_STORAGE";
   
 CREATE NICKNAME HBYC.T_B_CORP_LNK FOR SVR_BUSINESS.HBYC.T_B_CORP
 ����һ���ֵ��Զ����ͼ
 CREATE NICKNAME HBYC.T_B_DICT_LNK FOR SVR_123_HBDC.HBYC.T_B_DICT
 CREATE NICKNAME HBDC.T_K_CS_BSS_WEEK_CORP_CIG_LNK FOR SVR_123_HBDC.HBDC.T_K_CS_BSS_WEEK_CORP_CIG
 8.���������� ���� T_B_CORP_LNK �� T_B_EMPLOYEE_LNK �����Ƿ����ɹ�
 
 -----------drop---------------
 DROP SERVER server_name
   DROP USER MAPPING FOR authorization_name SERVER server_name
   DROP NICKNAME nickname
   DROP WRAPPER wrapper_name
   DROP NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
 -------------------------------------------------
 
 --------sql����----------------------------------
 ����2λС�� CAST(t12.SELL_AMOUNT as DECIMAL(25, 2))
 -------------------------------------------------
 
 
 ---------����---------------------------------------
 db2 export to \data\ttt.txt of del select * from SDE.GCDRULES
 db2 export to \t_b_sell_20111229.txt of del select * from dc.t_b_sell
 
 db2 export to \db2data\hbyc_t_b_client.txt of del select * from hbyc.t_b_client
 db2 export to c:\t_b_sell.txt of del select * from t_b_sell fetch first 200000 rows only
 
 db2 export to c:\T_B_ORDER.txt of del select * from t_terminal_callout
 db2 export to c:\T_B_ORDER_DETAIL.txt of del select * from t_terminal_callout_cig
 db2 load from t_b_sell.txt of del insert into t_b_sell
 db2 load client from C:\FTP\t_b_client.txt of del insert into HBYC.T_B_CLIENT
 db2 load client from c:\T_B_ORDER_DETAIL.txt of del insert into T_B_ORDER_DETAIL
 
 load ������RESTART INTO insert into terminate into
 db2 load client from c:\null.txt of del terminate into T_B_SYSPARAM
 db2 LOAD FROM  "e:\etlApp\upload/11421001/gxc2/T_B_CORP.txt" OF DEL RESTART INTO T_B_CORP;
 LOAD client FROM  "E:\db2data\T_B_EMPLOYEE.del" OF DEL RESTART INTO T_B_EMPLOYEE
 
 connect to hbdc user hbdc using hbdc123
 load CLIENT from E:\etlApp\exportdata\restore\t_b_buy_test_restore.del of del insert into t_b_buy_test_restore
 
 LOAD CLIENT FROM  "E:\etlApp\dataExport\t_b_corp_test.del" OF DEL INSERT INTO t_b_corp_test NONRECOVERABLE
 ---------------------------------------------------
 
 
 (��������Ҫ�ڱ���ִ��)
 db2 load from null.txt of del terminate into T_K_CS_MONTH_TOTAL_MPC
 load client from c:\null.txt of del terminate into essp_em_event
 ------------------------------
 ----��ѯ�������-----------
 db2 ? 22001 ���Կ� DB2 �� STATE ���͡�
 db2cmd -c -w -i db2 ? sql20076 ���Կ�SQLCODE�Ľ��͡�
 -----------------------------
 
 ������
 db2 export to 't_f_cig_month_sale.del' of del  select * from t_f_cig_month_sale
 
 db2 export to 'c:\sj.del' of del SELECT t.C_SJRQ,substr(t.C_DWDM,1,2) dw,t.Y_LXDM,t.Y_DBMC,t.Y_BWDM,sum(t.S_SGSL) sl,sum(t.S_SGJE) je FROM YY_SG.SGSJ t group by t.C_SJRQ,substr(t.C_DWDM,1,2),t.Y_LXDM,t.Y_DBMC,t.Y_BWDM
 
 ���룺
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL MODIFIED BY  COMPOUND=5 COMMITCOUNT 1000 insert into t_f_cig_month_sale
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL insert into t_f_cig_month_sale
 db2 IMPORT FROM 'E:\etlApp\exportdata\restore\t_b_buy_test_restore.del' OF DEL insert into t_b_buy_test_restore_bak
 ------------------------------
 
 --------���
DatabaseMetaData.getTables����ʱ���׳������µ��쳣��Ϣ: 
COM.ibm.db2.jdbc.DB2Exception:   [IBM][CLI Driver][DB2/AIX64]   SQL0443N     ����   "SYSIBM.SQLTABLES "���ض�����   "TABLES "�������˴�����ı�   "SYSIBM:CLI:-805 "   �Ĵ���   SQLSTATE��     SQLSTATE=38553 

db2 terminate
db2 CONNECT TO <dbname>
db2 BIND <path>/db2schema.bnd BLOCKING ALL GRANT PUBLIC sqlerror continue
db2 terminate
 
 
UPDATE hbyc.sd_order b SET b.bank_code=(select bank_code from   HBYC.MD_CUSTOMER_ACCOUNT t1 where  t1.IS_DEFAULT='1' and t1.CUST_ID=b.CUST_ID)
where COMPANY_ID='11421201' and ORDER_DATE='2014-11-17' and ( BANK_CODE='' or BANK_CODE is null)


���ݿ��Ż�����д���루Q���ƣ�

SELECT * FROM SYSCAT.TABLES WHERE TBSPACEID = 2 AND TABLEID = 252
SELECT * FROM SYSCAT.COLUMNS WHERE  TABNAME= 'HR_FLOW_INSTANCE_DETAIL' AND COLNO = 6

DB2���õ�����

db2 ? 42703
db2 ? sql811

db2expln -d db3 -q "select dict_code from zm.t_b_dict" -t

  ./ db2icrt -a 
1���������ݿ�
db2start
2��ֹͣ���ݿ�
db2stop
3���������ݿ�
db2 connect to o_yd user db2 using pwd
4�������ݿ�����������
db2 get dbm cfg
5��д���ݿ�����������
db2 update dbm cfg using ������ ����ֵ
6�������ݿ������
db2 connect to o_yd user db2 using pwd
db2 get db cfg for o_yd
7��д���ݿ������
db2 connect to o_yd user db2 using pwd
db2 update db cfg for o_yd using ������ ����ֵ
8���ر�����Ӧ������
db2 force application all
db2 force application ID1,ID2,,,Idn MODE ASYNC
(db2 list application for db o_yd show detail)
9���������ݿ�
db2 force application all
db2 backup db o_yd to d:
(db2 initialize tape on \\.\tape0)
(db2 rewind tape on \\.\tape0)
db2 backup db o_yd to \.\tape0
10���ָ����ݿ�
db2 restore db o_yd from d: to d: 
db2 restore db o_yd from \\.\tape0 to d:
db2 restore db loc_test from d:\DB_Bak taken at 20070305145246 to d:
11���󶨴洢����
db2 connect to o_yd user db2 using pwd
db2 bind c:\dfplus.bnd
�����洢���̵��������ϵ�C:\sqllib\functionĿ¼��
12�������
db2 connect to o_yd user db2 using pwd
db2 reorg table ydd
db2 runstats on table ydd with distribution and indexes all

13������������
db2 export to c:\dftz.txt of del select * from dftz
db2 export to c:\dftz.ixf of ixf select * from dftz
14�����������
import from c:\123.txt of del insert into ylbx.czyxx

db2 import to c:\dftz.txt of del commitcount 5000 messages c:\dftz.msg insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 messages c:\dftz.msg insert into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 insert_update into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 replace into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 create into dftz (��IXF)
db2 import to c:\dftz.ixf of ixf commitcount 5000 replace_create into dftz (��IXF)

15.db2move && db2look
����DB��
		db2move dbName export -sn schemaName -tn tabName1,tabName2,tab3* -u userid -p password
		db2look -d dbName -e -a -o db2look.sql
����DB��
		db2 create db dbName
		db2 -tvf db2look.sql
		db2move dbName import -io replace_create -u userid -p password
		db2 set integrity for prodinst.actor immediate checked --�������״̬��Ϊ����״̬
		
16��ִ��һ���������ļ�
db2 �Ctf �������ļ���
���ļ���ÿһ�������� ��������

17���Զ������������ļ�
���ı��ļ���temp.sql
select 'runstats on table DB2.' || tabname || ' with distribution and detailed indexes all;' from syscat.tables where tabschema='DB2' and type='T';
db2 �Ctf temp.sql>runstats.sql

18.��������
db2 rename table tta to rn_tab

17���Զ����ɽ�����ͼ�����
�ڷ������ϣ�C:\sqllib\miscĿ¼��
db2 connect to o_yd user db2 using pwd
db2look �Cd o_yd �Cu db2 �Ce �Cp �Cc c:\o_yd.txt

18����������
grant dbadm on database to user bb
db2icrt   ����ʵ��
db2idrop  ɾ��ʵ��
db2start  ����ʵ��
db2stop   ֹͣʵ�� 

CREATE DATABASE  testdb
( 2)  DFT_EXTENT_SZ 4
( 3)  CATALOG TABLESPACE MANAGED BY DATABASE USING
( 4)   (FILE 'C:\CAT\CATALOG.DAT' 2000, FILE 'D:\CAT\CATALOG.DAT' 2000)
( 5)    EXTENTSIZE 8
( 6)   PREFETCHSIZE 16
( 7) TEMPORARY TABLESPACE MANAGED BY SYSTEM USING
( 8)  ('C:\TEMPTS','D:\TEMPTS')
( 9) USER TABLESPACE MANAGED BY DATABASE USING
(10) (FILE 'C:\TS\USERTS.DAT' 121)
(11) EXTENTSIZE 24
(12)  PREFETCHSIZE 48 

19. select * from czyxx fetch first 1 rows only

20. db2look �Cd ylbx �Cu db2admin �Cw �Casd �Ca �Ce �Co a.txt
db2look -d rone -i db2admin -w db2admin -l -m  -e -a -o rone.sql
21. ��ʾ��ǰ�û����б� 
����list tables 
22.�г����е�ϵͳ�� 
����list tables for system
23.�鿴��ṹ 
����db2 describe select * from user.tables


24.��Ŀ���ݿ�
db2 catalog tcpip node jczhyw remote 10.68.116.12 server 50000
db2 catalog db HBADB_YW at node jczhyw

TO_CHAR (timestamp_expression_r,'YYY-MM-DD HH24:MI:SS')
TO_DATE (string_expression_r, 'YYY-MM-DD HH24:MI:SS')
