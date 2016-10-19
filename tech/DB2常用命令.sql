db2 catalog tcpip node n_wh remote 10.69.0.8 server 50000
db2 catalog db bpfdb as bpfdb_wh at node n_wh

select * from syscat.columns  a where a.TABNAME='T_EMARKETING_ARTICLE' and a.COLNO=3
SELECT CTTCTG_ID FROM T_EMARKETING_ARTICLE a

SELECT * FROM SYSCAT.TABLES WHERE TBSPACEID = 2 AND TABLEID = 13
SELECT * FROM SYSCAT.COLUMNS WHERE  TABNAME= '*******' AND COLNO = 8  

--SQL生成UUID
SELECT concat (hex (RAND ()), hex (RAND ()))  a INTO @UUID   FROM SYSIBM.SYSDUMMY1 WITH UR;

数据库优化：读写分离（Q复制）
NOT IN是自内向外的操作，即先得到子查询的结果，然后执行最外层的查询，而 NOT EXISTS 恰好相反，是自外向内的操作。

--加大DB2日志空间：
db2 connect to whhrdb user whhr using whhr_0804
db2 get db cfg for whhrdb
db2 update db cfg using LOGFILSIZ 10240
db2stop force
db2start
db2 get db cfg for whhrdb

DB2常用的命令

db2 ? 42703
db2 ? sql811

db2expln -d db3 -q "select dict_code from zm.t_b_dict" -t

  ./ db2icrt -a 
1．启动数据库
db2start
2．停止数据库
db2stop
3．连接数据库
db2 connect to o_yd user db2 using pwd
4．读数据库管理程序配置
db2 get dbm cfg
5．写数据库管理程序配置
db2 update dbm cfg using 参数名 参数值
6．读数据库的配置
db2 connect to o_yd user db2 using pwd
db2 get db cfg for o_yd
7．写数据库的配置
db2 connect to o_yd user db2 using pwd
db2 update db cfg for o_yd using 参数名 参数值
8．关闭所有应用连接
db2 force application all
db2 force application ID1,ID2,,,Idn MODE ASYNC
(db2 list application for db o_yd show detail)
9．备份数据库
db2 force application all
db2 backup db o_yd to d:
(db2 initialize tape on \\.\tape0)
(db2 rewind tape on \\.\tape0)
db2 backup db o_yd to \.\tape0
10．恢复数据库
db2 restore db o_yd from d: to d: 
db2 restore db o_yd from \\.\tape0 to d:
db2 restore db loc_test from d:\DB_Bak taken at 20070305145246 to d:
11．绑定存储过程
db2 connect to o_yd user db2 using pwd
db2 bind c:\dfplus.bnd
拷贝存储过程到服务器上的C:\sqllib\function目录中
12．整理表
db2 connect to o_yd user db2 using pwd
db2 reorg table ydd
db2 runstats on table ydd with distribution and indexes all

13．导出表数据
db2 export to c:\dftz.txt of del select * from dftz
db2 export to c:\dftz.ixf of ixf select * from dftz
14．导入表数据
import from c:\123.txt of del insert into ylbx.czyxx

db2 import to c:\dftz.txt of del commitcount 5000 messages c:\dftz.msg insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 messages c:\dftz.msg insert into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 insert_update into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 replace into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 create into dftz (仅IXF)
db2 import to c:\dftz.ixf of ixf commitcount 5000 replace_create into dftz (仅IXF)

15.db2move && db2look
导出DB：
		db2move dbName export -sn schemaName -tn tabName1,tabName2,tab3* -u userid -p password
		db2move whhrdb export -sn whhr -tn HR_PAY_DETAIL -u whhr -p whhr_0804
		db2look -d dbName -e -a -o db2look.sql
导入DB：
		db2 create db dbName
		db2 -tvf db2look.sql
		db2move dbName import -io replace_create -u userid -p password
		db2 set integrity for prodinst.actor immediate checked --将表挂起状态改为正常状态
		
16．执行一个批处理文件
db2 –tf 批处理文件名
（文件中每一条命令用 ；结束）

17．自动生成批处理文件
建文本文件：temp.sql
select 'runstats on table DB2.' || tabname || ' with distribution and detailed indexes all;' from syscat.tables where tabschema='DB2' and type='T';
db2 –tf temp.sql>runstats.sql

18.表重命名
db2 rename table tta to rn_tab

17．自动生成建表（视图）语句
在服务器上：C:\sqllib\misc目录中
db2 connect to o_yd user db2 using pwd
db2look –d o_yd –u db2 –e –p –c c:\o_yd.txt

18．其他命令
grant dbadm on database to user bb
db2icrt   创建实例
db2idrop  删除实例
db2start  启动实例
db2stop   停止实例 

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

20. db2look –d ylbx –u db2admin –w –asd –a –e –o a.txt
db2look -d rone -i db2admin -w db2admin -l -m  -e -a -o rone.sql
21. 显示当前用户所有表 
　　list tables 
22.列出所有的系统表 
　　list tables for system
23.查看表结构 
　　db2 describe select * from user.tables


24.编目数据库
db2 catalog tcpip node local remote 数据库IP server 50000
db2 catalog db 数据库名 as 数据库别名 at node local

db2 catalog tcpip node n_itil remote 10.68.18.55 server 50000
db2 catalog db ITIL as ITIL at node n_itil

move单个表的脚本：
db2move whbpf export -tn t_b_cig_sale_info -u hbyc -p hbyc >whbpf23.log
db2move whywtest import -io replace_create -u db2admin -p db2admin >whbpfdb23.log
db2move mydb import -io replace_create -u db2admin -p db2admin


TO_CHAR (timestamp_expression_r,'YYY-MM-DD HH24:MI:SS')
TO_DATE (string_expression_r, 'YYY-MM-DD HH24:MI:SS')

-----数据库性能监控--------
topas
shift+`切换
按l看cpu趋势图

-------IBM记录------------------
北京IBM测试服务器 ： http://172.16.50.20 114201010320 1
db2执行计划分析 需要建一套表
数据库：172.16.50.22 hbyc 1

----vi用法------------
vi 文件名 进入vi；
:q! 退出

---db2top用法---------------------
db2top -d bpfdb -u hbyc -p 1
按D，进入动态sql监控
按z，倒序排序
输入列的数据，序号是从0开始
按L，输入sql的序列号，查看sql明细



----------解锁-------------------
 load client from c:\ftp\null.txt of del terminate into hbyc.T_B_CLIENT
 reorg table [table] 通过重构行来消除“碎片”数据并压缩信息，对表进行重组。
 runstats on table [table] 收集表 的统计信息。
 SET INTEGRITY FOR [table] IMMEDIATE CHECKED 
 SET INTEGRITY FOR temp_test IMMEDIATE CHECKED 
 
 ----crontab -e操作---------------
 i 开始插入
 ：，ｗ，写入。
 ：，ｑ，退出
 
 ----查看表空间大小----------
 list tablespaces show detail
 
 ------编目---------------
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

 ----编目----------------
 --查看所有编目信息
 list db directory
 --注册节点 
 db2 catalog tcpip node WLTDB remote 10.69.0.20 server 50000
 --注册数据库 
 db2 catalog database BPFDB as WLTDB at node WLTDB
 --删除注册节点 
db2 uncatalog node nd117
 --删除注册数据库 
db2 uncatalog database dc117
 
 -------------------------
 ----导表结构--------------------
 db2look -d dbname -e -z schema_name -i userid -w password -o C:/out.sql
 
 db2look -d whiso -e -z essp -i essp -w essp-o C:/out.sql
 
 
 db2move WHISO EXPORT -tn jbpm_* -u essp -p essp
 ----新建存储过程-----------------
 1、
 
 db2cmd db2 connect to hbdc_new user hbdc using hbdc232
 db2cmd db2 connect to hbdc user dc using hbdc213
 2、
 cd E:\中软\SVN\数据中心存储过程\procedure\application
 cd E:\中软\SVN\数据中心存储过程\procedure-datacenter(province)
 db2  -td@ -vf P_A_CORP_ANALYSE_ORDER.sql
 db2  -td@ -vf P_A_CIG_RATE.sql
 
 
 E:
 cd E:\中软\SVN\数据中心存储过程\117hbdc
 db2cmd db2 connect to hbdc_NEW user hbdc using hbdc232
 db2 -td@ -vf P_B_LOAD.SQL
 
 db2cmd db2 connect to hbdc user ds using 123
 db2 -td@ -vf P_SYNC_TO_APP.SQL
 db2cmd db2 connect to tszdc user hbdc using hbdc
 db2 -td@ -vf PROC_TEST.sql 
 ------存储过程模板--------------------------
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
 -------117小机的编目信息------------------
 HBYC就是123的HBDC数据库
 YANYEDB就是烟叶省公司的DB2数据库，有收购信息
 ------------------------------------------
 db2 force application all
 
 db2start
 
 db2stop
 ------------------------------------
 备份数据库
 db2 force application all
 db2 backup db o_yd to d:
 db2 backup db gisdb to \gisdb_bak
 (db2 initialize tape on \\.\tape0)
 (db2 rewind tape on \\.\tape0)
 db2 backup db o_yd to \.\tape0
 db2 backup db netdb to /backup
 db2 backup db testdb to /data/bak
 恢复数据库
 db2 restore db o_yd from d: to d: 
 db2 restore db o_yd from \\.\tape0 to d:
 ---------------
 --------查看表空间结构---------
 connect to szdc
 list tablespaces show detail
 ----------
 
 db2 restore db szdc from /data/bak to /data/database
 db2 RESTORE DATABASE SZDC FROM /data/database/bak TAKEN AT 20100825034006 TO /data/database
 
 db2 restore db netdb from /  to /data/database
 ----------------建库---------------------------------------------
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
 
 ----------远程视图-------------------------------
 1、连接业务数据库，打开数据库管理器的联合(federated)属性
         db2
         db2 =>update dbm cfg using federated YES
         db2 =>db2stop force
         db2 =>db2start
 
 2.编目业务节点和BPFDB数据库,并正确连通（list node directory 查看如果有则不需建立）
         db2 =>catalog tcpip node nodebpf remote 业务数据库IP server 50000
         db2 =>catalog db BPFDB at node nodebpf
 
 3.登陆物流数据库GISDB
         db2 =>connect to 物流DB user hbyc using ***
 
 4.建立db2(drda)包装器
         db2 =>create wrapper drda
 
 5.建立远程服务器(svr_business)指向远程的数据源(BPFDB)，同时指定远程的验证信息(user:hbyc pwd:***)，登陆和密码及数据库版本根据实际修改
 db2 => create server svr_business type db2/aix version 8.2 wrapper drda authorization "hbyc" password "xgyc090919" options(dbname 'bpfdb')
 create server svr_net1 type db2/aix version 8.2 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_net_win8 type db2/nt version 8 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_whbpf type db2/nt version 8 wrapper drda authorization "hbyc" password "hbyc" options(dbname 'whbpf')
 
 6.建立本地用户至远程登陆的映射，登陆和密码根据实际修改
 db2 =>create user mapping for "JCZH" server svr_whbpf options (remote_authid 'hbyc', remote_password 'hbyc')
 
 7.用本地登陆用户(hbyc)重新登陆物流库，建立远程表的昵称(远程视图)，物流库执行：
 CREATE NICKNAME HBYC.T_B_EMPLOYEE_LNK FOR SVR_BUSINESS.HBYC.T_B_EMPLOYEE
 CREATE NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
   FOR "SVR_NET_WIN8"."DB2ADMIN"."T_TERMINAL_CLIENT_STORAGE";
   
 CREATE NICKNAME HBYC.T_B_CORP_LNK FOR SVR_BUSINESS.HBYC.T_B_CORP
 新增一个字典表远程视图
 CREATE NICKNAME HBYC.T_B_DICT_LNK FOR SVR_123_HBDC.HBYC.T_B_DICT
 CREATE NICKNAME HBDC.T_K_CS_BSS_WEEK_CORP_CIG_LNK FOR SVR_123_HBDC.HBDC.T_K_CS_BSS_WEEK_CORP_CIG
 8.在物流库中 访问 T_B_CORP_LNK 和 T_B_EMPLOYEE_LNK 看看是否建立成功
 
 -----------drop---------------
 DROP SERVER server_name
   DROP USER MAPPING FOR authorization_name SERVER server_name
   DROP NICKNAME nickname
   DROP WRAPPER wrapper_name
   DROP NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
 -------------------------------------------------
 
 --------sql技巧----------------------------------
 保留2位小数 CAST(t12.SELL_AMOUNT as DECIMAL(25, 2))
 -------------------------------------------------
 
 
 ---------导数---------------------------------------
 db2 export to \data\ttt.txt of del select * from SDE.GCDRULES
 db2 export to \t_b_sell_20111229.txt of del select * from dc.t_b_sell
 
 db2 export to \db2data\hbyc_t_b_client.txt of del select * from hbyc.t_b_client
 db2 export to c:\t_b_sell.txt of del select * from t_b_sell fetch first 200000 rows only
 
 db2 export to c:\T_B_ORDER.txt of del select * from t_terminal_callout
 db2 export to c:\T_B_ORDER_DETAIL.txt of del select * from t_terminal_callout_cig
 db2 load from t_b_sell.txt of del insert into t_b_sell
 db2 load client from C:\FTP\t_b_client.txt of del insert into HBYC.T_B_CLIENT
 db2 load client from c:\T_B_ORDER_DETAIL.txt of del insert into T_B_ORDER_DETAIL
 
 load 参数：RESTART INTO insert into terminate into
 db2 load client from c:\null.txt of del terminate into T_B_SYSPARAM
 db2 LOAD FROM  "e:\etlApp\upload/11421001/gxc2/T_B_CORP.txt" OF DEL RESTART INTO T_B_CORP;
 LOAD client FROM  "E:\db2data\T_B_EMPLOYEE.del" OF DEL RESTART INTO T_B_EMPLOYEE
 
 connect to hbdc user hbdc using hbdc123
 load CLIENT from E:\etlApp\exportdata\restore\t_b_buy_test_restore.del of del insert into t_b_buy_test_restore
 
 LOAD CLIENT FROM  "E:\etlApp\dataExport\t_b_corp_test.del" OF DEL INSERT INTO t_b_corp_test NONRECOVERABLE
 ---------------------------------------------------
 
 
 (此命令需要在本地执行)
 db2 load from null.txt of del terminate into T_K_CS_MONTH_TOTAL_MPC
 load client from c:\null.txt of del terminate into essp_em_event
 ------------------------------
 ----查询出错代码-----------
 db2 ? 22001 可以看 DB2 的 STATE 解释。
 db2cmd -c -w -i db2 ? sql20076 可以看SQLCODE的解释。
 -----------------------------
 
 导出：
 db2 export to 't_f_cig_month_sale.del' of del  select * from t_f_cig_month_sale
 
 db2 export to 'c:\sj.del' of del SELECT t.C_SJRQ,substr(t.C_DWDM,1,2) dw,t.Y_LXDM,t.Y_DBMC,t.Y_BWDM,sum(t.S_SGSL) sl,sum(t.S_SGJE) je FROM YY_SG.SGSJ t group by t.C_SJRQ,substr(t.C_DWDM,1,2),t.Y_LXDM,t.Y_DBMC,t.Y_BWDM
 
 导入：
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL MODIFIED BY  COMPOUND=5 COMMITCOUNT 1000 insert into t_f_cig_month_sale
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL insert into t_f_cig_month_sale
 db2 IMPORT FROM 'E:\etlApp\exportdata\restore\t_b_buy_test_restore.del' OF DEL insert into t_b_buy_test_restore_bak
 ------------------------------
 
 --------解决
DatabaseMetaData.getTables方法时，抛出了如下的异常信息: 
COM.ibm.db2.jdbc.DB2Exception:   [IBM][CLI Driver][DB2/AIX64]   SQL0443N     例程   "SYSIBM.SQLTABLES "（特定名称   "TABLES "）返回了带诊断文本   "SYSIBM:CLI:-805 "   的错误   SQLSTATE。     SQLSTATE=38553 

db2 terminate
db2 CONNECT TO <dbname>
db2 BIND <path>/db2schema.bnd BLOCKING ALL GRANT PUBLIC sqlerror continue
db2 terminate
 
--存储过程中通过预编译调用动态过程
declare @ls_call_sql varchar(100) default 'call #allot_proc_name(?, ?, ?, ?, ?)';
--调用相应分配策略
set @ls_allot_proc_name = (select p_value from t_st_parameter where p_name = 'curr_in_allot_proc');
set @ls_call_sql = replace(@ls_call_sql, '#allot_proc_name', @ls_allot_proc_name);

prepare s1 from @ls_call_sql;
execute s1 into @os_errmsg using @in_in_no, @is_cig_code, @in_in_qty, @in_unit_code;
get diagnostics @ln_call_rtn = DB2_RETURN_STATUS;
if @ln_call_rtn <> 0 then
    return @ln_call_rtn;
end if;

/********************最新WAS和DB2命令*******************************/
启动WAS:
cd /home/db2admin/sqllib
. ./db2profile

cd /usr/IBM/WebSphere/AppServer/profiles/Dmgr01/bin
./startManager.sh

cd /usr/IBM/WebSphere/AppServer/profiles/AppSrv01/bin
./startNode.sh


建立数据库脚本：
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


“restore”命令必须要用DB2ADMIN的身份连接数据库啊，不能用WHICSS
db2 connect to bpfdb
没有建库直接恢复数据库：
db2 restore db bpfdb from /tmp taken at 20071009202144
该数据库已经存在，恢复该数据库：
db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing

db2 restore db bpfdb from /tmp taken at 200710092002144 into bpfdb
DB2实例的容器路径不同，需要重定向恢复：
db2 restore db bpfdb from /tmp taken at 20071009202144 into bpfdb redirect without rolling forward
db2 "set tablespace containers for 0 using (path "/data/database/bpfdb/catp")"
db2 "set tablespace containers for 1 using (path "/data/database/bpfdb/tmtp")"
db2 "set tablespace containers for 2 using (path "/data/database/bpfdb/ustp")"
db2 "set tablespace containers for 3 using (path "/data/database/bpfdb/utmtp")"
db2 "set tablespace containers for 4 using (path "/data/database/bpfdb/tlstp")" 
db2 restore db bpfdb continue 

如果数据库恢复不完整，就先删该数据库，再恢复：
db2 drop database bpfdb
数据库删除后，一下的5个容器目录应该会自动删除，如果没有自动删除，就执行下面5条命令，如果已经自动删除了，就跳过下面5条命令
db2untag -f /data/database/catp
db2untag -f /data/database/tmtp
db2untag -f /data/database/ustp
db2untag -f /data/database/utmtp
db2untag -f /data/database/tlstp
db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing


查看当前登陆用户：
whoami
/********************最新WAS和DB2命令*******************************/


C:\>db2cmd

C:\>set db2instance=rone
C:\>db2start

C:\>db2 terminate
C:\>db2stop
--强行停止
C:\>db2stop force

C:\>db2 list application

--连接数据库
C:\>db2 connect to rone

--执行SQL语句,并分屏显示
C:\>db2 "select * from db2admin.ro_code_city" | more

数据库恢复操作:
db2 restore db sample from D:\DB2Backups taken at 20010320122644

--显示所有数据库信息
C:\>db2 list db directory

--打开文本文件命令：
tail -100 SystemOut.log

/************************ 备份/恢复*********************************************
su - db2admin
db2 connect to jzdc usre db2admin using db2admin
db2 force applications all
db2 backup db ldapdb2 to /temp/backup
db2stop force
db2start

db2 backup db ldapdb2 to directory_or_device
db2 restore db ldapdb2 from /temp/backup replace existing
其中 /temp/backup 是存储备份的目录或设备的名称。

1.BACKUP
C:\>db2 backup db rone user db2admin using db2admin to e:

备份成功。此备份映像的时间戳记是：20060421110354

2.RESTORE:
C:\>db2 restore db rone from e taken at 20060421110354 to e redirect
SQL1035N  当前正在使用数据库。  SQLSTATE=57019

C:\>db2 restore db rone from e taken at 20060421110354 to e redirect
SQL2539W  警告！正在复原至与备份映像数据库相同的现有数据库。数据库文件将被删除。

想要继续吗？（y/n） y
SQL1277N  复原已检测到一个或多个表空间容器是不可访问的，或者已将它们的状态设置为

“必须定义存储器”。
DB20000I  RESTORE DATABASE 命令成功完成。

C:\>db2 list tablespaces show detail

           当前数据库的表空间

 表空间标识                        = 0
 名称                              = SYSCATSPACE
 类型                              = 系统管理空间
 内容                              = 任何数据
 状态                              = 0x2000100
   详细解释：
     复原暂挂
     可以定义存储器

 表空间标识                        = 1
 名称                              = TEMPSPACE1
 类型                              = 系统管理空间
 内容                              = 系统临时数据
 状态                              = 0x2000100
   详细解释：
     复原暂挂
     可以定义存储器

 表空间标识                        = 2
 名称                              = USERSPACE1
 类型                              = 系统管理空间
 内容                              = 任何数据
 状态                              = 0x2000100
   详细解释：
     复原暂挂
     可以定义存储器

 表空间标识                        = 3
 名称                              = SYSTOOLSPACE
 类型                              = 系统管理空间
 内容                              = 任何数据
 状态                              = 0x2000100
   详细解释：
     复原暂挂
     可以定义存储器

SQL1350N  应用程序未处于正确状态而不能处理此请求。原因码 = "3"。

C:\>DB2 SET TABLESPACE CONTAINERS FOR 0 USING(PATH 'E:\ts0con1')
DB20000I  SET TABLESPACE CONTAINERS 命令成功完成。

C:\>DB2 SET TABLESPACE CONTAINERS FOR 1 USING(PATH 'E:\ts1con1')
DB20000I  SET TABLESPACE CONTAINERS 命令成功完成。

C:\>DB2 SET TABLESPACE CONTAINERS FOR 2 USING(PATH 'E:\ts2con1')
DB20000I  SET TABLESPACE CONTAINERS 命令成功完成。

C:\>DB2 SET TABLESPACE CONTAINERS FOR 3 USING(PATH 'E:\ts3con1')
DB20000I  SET TABLESPACE CONTAINERS 命令成功完成。

C:\>db2 restore db rone continue
DB20000I  RESTORE DATABASE 命令成功完成。
**********************************************************************************/

--显示多个这个数据库的备份纪录
C:\>Db2 list history backup all for rone



db2 restore db sample from D:\DB2Backups taken at 20010320122644
 系统数据库目录

 目录中的条目数 = 1

数据库 1 条目：

 数据库别名                      = TOOLSDB
 数据库名称                      = TOOLSDB
 数据库驱动器                    = C:\DB2
 数据库发行版级别                = a.00
 注释                            =
 目录条目类型                    = 间接
 目录数据库分区号                = 0
 备用服务器主机名                =
 备用服务器端口号                =
 
 
**********************从 DB2 客户机连接到 DB2 Linux/Unix/Windows 服务器***************************
 C:\>db2 list node directory
SQL1027N  找不到节点目录。

C:\>db2 catalog tcpip node db9 remote 10.68.19.9 server 50000
DB20000I  CATALOG TCPIP NODE 命令成功完成。
DB21056W  只有在刷新目录高速缓存以后，目录更改才会生效。

C:\>db2 catalog db rone as rone1 at node db9
DB20000I  CATALOG DATABASE 命令成功完成。
DB21056W  只有在刷新目录高速缓存以后，目录更改才会生效。

C:\>db2 terminate
DB20000I  TERMINATE 命令成功完成。

C:\>db2 connect to rone1 user dc using 123
***************************************************************************************************
C:\>db2 create db rone
DB20000I  CREATE DATABASE 命令成功完成。

************************************************移动数据库(db2move)********************************
D:\rone_back>db2look -d toolsdb -e  -l -f -o toolsdb.sql

倒出数据库(D:\rone_back 数据库移动文件倒出目录)
D:\rone_back>db2move rone1 export -u dc -p 123

db2move ez-bpfdb export -sn hbyc -tn t_s_p_*,t_b_employee,t_b_dict,t_b_corp,t_cc_* -u whyc -p 1

用DBA工具建一个新库(目标库:sample)
用DBA工具倒出源库(rone1)的建库教本(rone1 ->  鼠标右键-> Extract)
将源库的建库脚本在目标库执行,将源库的表和其他的对象全部建立

用指定的用户标识和密码以 REPLACE 方式导入 sample 数据库中的所有表：
D:\rone_back>db2move sample import -io replace_create -u userid -p password

而下面这条命令则以 REPLACE 方式装入 db2admin 和 db2user 模式下的所有表：
D:\rone_back>db2move sample load -sn db2admin, db2user -lo REPLACE

只导部分表：
db2move jmdc export -tn T_B_C*,T_B_D*,T_B_E*,T_B_L*,T_B_P*,T_B_SA*,T_B_Y* -u dc -p 123 

G:\DB>db2move ez_bpfdb export -sn hbyc -tn t_s_p_*,t_cc_*,t_b_employee,t_b_corp,t_b_dict,t_b_dict_index,t_b_line,t_b_modify_index,t_b_client_deliver,t_b_client_manage,t_b_client_market,t_b_client_regie,t_b_client_system -u hbyc -p ezyc100315
****************************************************************************************************

取消数据库编目：
C:\>db2 uncatalog db complain
DB20000I  UNCATALOG DATABASE 命令成功完成。
DB21056W  只有在刷新目录高速缓存以后，目录更改才会生效。
db2move bpfdb_sz export -sn db2admin -tn t_eval_*,t_act_*,t_s_p_*,t_b_employee,t_b_corp -u hbyc -p szyc1019


db2move bpfdb_sz export -sn hbyc -tn t_eval_*,t_act_*,t_s_p_r*,t_b_employee,t_b_corp,t_b_dict,t_b_dict_index,t_b_line,t_b_modify_index,t_b_client_deliver,t_b_client_manage,t_b_client_market,t_b_client_regie,t_b_client_system -u hbyc -p szyc1019



重新对一个已经存在的（已编目）数据库再次编目：
C:\>db2 catalog db hbdc as com_zm at node db4
DB20000I  CATALOG DATABASE 命令成功完成。
DB21056W  只有在刷新目录高速缓存以后，目录更改才会生效。

对一个数据库中有多个用户，用一个用户登陆：
C:\>db2 connect to com_zm user complain using 123

如何执行DB2的脚本文件? 
D:\>db2 -vtf rone.sql

DB2中象ORACLE的ROWNUM()是? 
	select NAME,TBNAME,ROW_NUMBER()OVER() from sysibm.SYSCOLUMNS WHERE TBNAME='RO_PERSON' 

如何取当前时间? 
SELECT CURRENT TIMESTAMP FROM SYSIBM.SYSDUMMY1

DB2日期函数：
select current date + 3 YEARS + 2 MONTHS + 15 DAYS  from sysibm.sysdummy1
	
从数据表中取指定前几条记录 
select  *  from tb_market_code fetch first 1 rows only 

预防字段空值的处理 
SELECT DEPTNO ,DEPTNAME ,COALESCE(MGRNO ,'ABSENT'),ADMRDEPT 
FROM DEPARTMENT 
   COALESCE函数返回()中表达式列表中第一个不为空的表达式，可以带多个表达式。 
   和oracle的isnull类似，但isnull好象只能两个表达式。
   
如何知道表的字段的状况:
select * from sysibm.SYSCOLUMNS WHERE TBNAME='RO_PERSON' 

C:\>db2 catalog tcpip node aix123 remote 10.68.0.123 server 50000
DB20000I  CATALOG TCPIP NODE 命令成功完成。
DB21056W  只有在刷新目录高速缓存以后，目录更改才会生效。

C:\>db2 catalog database hbdc as hbdc at node aix123
DB20000I  CATALOG DATABASE 命令成功完成。
DB21056W  只有在刷新目录高速缓存以后，目录更改才会生效。

C:\>ping 10.68.0.123


java.text.SimpleDateFormat sf = new java.text.SimpleDateFormat("yyyy-MM-dd");
String todayStr = sf.format(new Date()); 



ALTER TABLE COMPLAIN.T_RECEIVE
  ADD PRIMARY KEY
   (RECEIVE_CODE
   );
#SYNC 10;

将类型转换为decimal即可：    
  select   cast(col1   as   decimal(20,4))/cast(col2   as   decimal(20,4))   as   result   from   table1 

--判断存在 t_cc_order 但是 t_cc_bank_check_index没有的记录：
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


--列出 t_cc_bank_check_index 中有重复的记录：
SELECT COUNT(*),order_id FROM t_cc_bank_check_index GROUP BY order_id HAVING COUNT(*)>1

查询当前时间，当前日期：
select order_id ,current time,current date from t_cc_order

from 目录 taken at xxxxx replace existing 

db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing

db2 restore db bpfdb from /tmp taken at 20071009202144 replace existing还是这个与语句吗？replace existing这个还要不要啊 

db2 restore db bpfdb from /tmp taken at 200710092002144 into bpfdb  

-----数据库性能监控--------
topas
shift+`切换
按l看cpu趋势图

-------IBM记录------------------
北京IBM测试服务器 ： http://172.16.50.20 114201010320 1
db2执行计划分析 需要建一套表
数据库：172.16.50.22 hbyc 1

----vi用法------------
vi 文件名 进入vi；
:q! 退出

---db2top用法---------------------
db2top -d bpfdb -u hbyc -p 1
按D，进入动态sql监控
按z，倒序排序
输入列的数据，序号是从0开始
按L，输入sql的序列号，查看sql明细

-----存储过程执行过程名是变量---------
declare @ls_call_sql varchar(100) default 'call #allot_proc_name(?, ?, ?, ?, ?)';
    --调用相应分配策略
    set @ls_allot_proc_name = (select p_value from t_st_parameter where p_name = 'curr_in_allot_proc');
    set @ls_call_sql = replace(@ls_call_sql, '#allot_proc_name', @ls_allot_proc_name);

    prepare s1 from @ls_call_sql;
    execute s1 into @os_errmsg using @in_in_no, @is_cig_code, @in_in_qty, @in_unit_code;
    get diagnostics @ln_call_rtn = DB2_RETURN_STATUS;
    if @ln_call_rtn <> 0 then
        return @ln_call_rtn;
    end if;



----------解锁-------------------
 load client from c:\ftp\null.txt of del terminate into hbyc.T_B_CLIENT
 reorg table [table] 通过重构行来消除“碎片”数据并压缩信息，对表进行重组。
 runstats on table [table] 收集表 的统计信息。
 SET INTEGRITY FOR [table] IMMEDIATE CHECKED 
 SET INTEGRITY FOR temp_test IMMEDIATE CHECKED 
 
 ----crontab -e操作---------------
 i 开始插入
 ：，ｗ，写入。
 ：，ｑ，退出
 
 ----查看表空间大小----------
 list tablespaces show detail
 
 ------编目---------------
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

 ----编目----------------
 --查看所有编目信息
 list db directory
 --注册节点 
 db2 catalog tcpip node YANYEDB remote 10.68.0.131 server 50000
 --注册数据库 
 db2 catalog database yanyedb as YANYEDB at node YANYEDB
 --删除注册节点 
db2 uncatalog node nd117
 --删除注册数据库 
db2 uncatalog database dc117
 
 -------------------------
 ----导表结构--------------------
 db2look -d dbname -e -z schema_name -i userid -w password -o C:/out.sql
 
 db2look -d whiso -e -z essp -i essp -w essp-o C:/out.sql
 
 db2move WHISO EXPORT -tn jbpm_* -u essp -p essp
 ----新建存储过程-----------------
 1、
 db2cmd db2 connect to WHBPFTST user HBYC using 123
 db2cmd db2 connect to hbdc_new user hbdc using hbdc232
 db2cmd db2 connect to hbdc user dc using hbdc213
 2、
 cd E:\中软\SVN\数据中心存储过程\procedure\application
 cd E:\中软\SVN\数据中心存储过程\procedure-datacenter(province)
 db2  -td@ -vf P_A_CORP_ANALYSE_ORDER.sql
 db2  -td@ -vf P_A_CIG_RATE.sql
 
------过程中调用动态过程------------
declare @ls_call_sql varchar(100) default 'call #allot_proc_name(?, ?, ?, ?, ?)';
    --调用相应分配策略
    set @ls_allot_proc_name = (select p_value from t_st_parameter where p_name = 'curr_in_allot_proc');
    set @ls_call_sql = replace(@ls_call_sql, '#allot_proc_name', @ls_allot_proc_name);

    prepare s1 from @ls_call_sql;
    execute s1 into @os_errmsg using @in_in_no, @is_cig_code, @in_in_qty, @in_unit_code;
    get diagnostics @ln_call_rtn = DB2_RETURN_STATUS;
    if @ln_call_rtn <> 0 then
        return @ln_call_rtn;
    end if;
 
 E:
 cd E:\中软\SVN\数据中心存储过程\117hbdc
 db2cmd db2 connect to hbdc_NEW user hbdc using hbdc232
 db2 -td@ -vf P_B_LOAD.SQL
 
 db2cmd db2 connect to hbdc user ds using 123
 db2 -td@ -vf P_SYNC_TO_APP.SQL
 db2cmd db2 connect to tszdc user hbdc using hbdc
 db2 -td@ -vf PROC_TEST.sql 
 ------存储过程模板--------------------------
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
 -------117小机的编目信息------------------
 HBYC就是123的HBDC数据库
 YANYEDB就是烟叶省公司的DB2数据库，有收购信息
 ------------------------------------------
 db2 force application all
 
 db2start
 
 db2stop
 ------------------------------------
 备份数据库
 db2 force application all
 db2 backup db o_yd to d:
 db2 backup db gisdb to \gisdb_bak
 (db2 initialize tape on \\.\tape0)
 (db2 rewind tape on \\.\tape0)
 db2 backup db o_yd to \.\tape0
 db2 backup db netdb to /backup
 db2 backup db testdb to /data/bak
 恢复数据库
 db2 restore db o_yd from d: to d: 
 db2 restore db o_yd from \\.\tape0 to d:
 ---------------
 --------查看表空间结构---------
 connect to szdc
 list tablespaces show detail
 ----------
 
 db2 restore db szdc from /data/bak to /data/database
 db2 RESTORE DATABASE SZDC FROM /data/database/bak TAKEN AT 20100825034006 TO /data/database
 
 db2 restore db netdb from /  to /data/database
 ----------------建库---------------------------------------------
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
 
 ----------远程视图-------------------------------
 1、连接业务数据库，打开数据库管理器的联合(federated)属性
         db2
         db2 =>update dbm cfg using federated YES
         db2 =>db2stop force
         db2 =>db2start
 
 2.编目业务节点和BPFDB数据库,并正确连通（list node directory 查看如果有则不需建立）
         db2 =>catalog tcpip node nodebpf remote 业务数据库IP server 50000
         db2 =>catalog db BPFDB at node nodebpf
 
 3.登陆物流数据库GISDB
         db2 =>connect to 物流DB user hbyc using ***
 
 4.建立db2(drda)包装器
         db2 =>create wrapper drda
 
 5.建立远程服务器(svr_business)指向远程的数据源(BPFDB)，同时指定远程的验证信息(user:hbyc pwd:***)，登陆和密码及数据库版本根据实际修改
 db2 => create server svr_business type db2/aix version 8.2 wrapper drda authorization "hbyc" password "xgyc090919" options(dbname 'bpfdb')
 create server svr_net1 type db2/aix version 8.2 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_net_win8 type db2/nt version 8 wrapper drda authorization "db2admin" password "db2admin" options(dbname 'netdb')
 create server svr_whbpf type db2/nt version 8 wrapper drda authorization "hbyc" password "hbyc" options(dbname 'whbpf')
 
 6.建立本地用户至远程登陆的映射，登陆和密码根据实际修改
 db2 =>create user mapping for "JCZH" server svr_whbpf options (remote_authid 'hbyc', remote_password 'hbyc')
 
 7.用本地登陆用户(hbyc)重新登陆物流库，建立远程表的昵称(远程视图)，物流库执行：
 CREATE NICKNAME HBYC.T_B_EMPLOYEE_LNK FOR SVR_BUSINESS.HBYC.T_B_EMPLOYEE
 CREATE NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
   FOR "SVR_NET_WIN8"."DB2ADMIN"."T_TERMINAL_CLIENT_STORAGE";
   
 CREATE NICKNAME HBYC.T_B_CORP_LNK FOR SVR_BUSINESS.HBYC.T_B_CORP
 新增一个字典表远程视图
 CREATE NICKNAME HBYC.T_B_DICT_LNK FOR SVR_123_HBDC.HBYC.T_B_DICT
 CREATE NICKNAME HBDC.T_K_CS_BSS_WEEK_CORP_CIG_LNK FOR SVR_123_HBDC.HBDC.T_K_CS_BSS_WEEK_CORP_CIG
 8.在物流库中 访问 T_B_CORP_LNK 和 T_B_EMPLOYEE_LNK 看看是否建立成功
 
 -----------drop---------------
 DROP SERVER server_name
   DROP USER MAPPING FOR authorization_name SERVER server_name
   DROP NICKNAME nickname
   DROP WRAPPER wrapper_name
   DROP NICKNAME "HBYC"."T_TERMINAL_CLIENT_STORAGE"
 -------------------------------------------------
 
 --------sql技巧----------------------------------
 保留2位小数 CAST(t12.SELL_AMOUNT as DECIMAL(25, 2))
 -------------------------------------------------
 
 
 ---------导数---------------------------------------
 db2 export to \data\ttt.txt of del select * from SDE.GCDRULES
 db2 export to \t_b_sell_20111229.txt of del select * from dc.t_b_sell
 
 db2 export to \db2data\hbyc_t_b_client.txt of del select * from hbyc.t_b_client
 db2 export to c:\t_b_sell.txt of del select * from t_b_sell fetch first 200000 rows only
 
 db2 export to c:\T_B_ORDER.txt of del select * from t_terminal_callout
 db2 export to c:\T_B_ORDER_DETAIL.txt of del select * from t_terminal_callout_cig
 db2 load from t_b_sell.txt of del insert into t_b_sell
 db2 load client from C:\FTP\t_b_client.txt of del insert into HBYC.T_B_CLIENT
 db2 load client from c:\T_B_ORDER_DETAIL.txt of del insert into T_B_ORDER_DETAIL
 
 load 参数：RESTART INTO insert into terminate into
 db2 load client from c:\null.txt of del terminate into T_B_SYSPARAM
 db2 LOAD FROM  "e:\etlApp\upload/11421001/gxc2/T_B_CORP.txt" OF DEL RESTART INTO T_B_CORP;
 LOAD client FROM  "E:\db2data\T_B_EMPLOYEE.del" OF DEL RESTART INTO T_B_EMPLOYEE
 
 connect to hbdc user hbdc using hbdc123
 load CLIENT from E:\etlApp\exportdata\restore\t_b_buy_test_restore.del of del insert into t_b_buy_test_restore
 
 LOAD CLIENT FROM  "E:\etlApp\dataExport\t_b_corp_test.del" OF DEL INSERT INTO t_b_corp_test NONRECOVERABLE
 ---------------------------------------------------
 
 
 (此命令需要在本地执行)
 db2 load from null.txt of del terminate into T_K_CS_MONTH_TOTAL_MPC
 load client from c:\null.txt of del terminate into essp_em_event
 ------------------------------
 ----查询出错代码-----------
 db2 ? 22001 可以看 DB2 的 STATE 解释。
 db2cmd -c -w -i db2 ? sql20076 可以看SQLCODE的解释。
 -----------------------------
 
 导出：
 db2 export to 't_f_cig_month_sale.del' of del  select * from t_f_cig_month_sale
 
 db2 export to 'c:\sj.del' of del SELECT t.C_SJRQ,substr(t.C_DWDM,1,2) dw,t.Y_LXDM,t.Y_DBMC,t.Y_BWDM,sum(t.S_SGSL) sl,sum(t.S_SGJE) je FROM YY_SG.SGSJ t group by t.C_SJRQ,substr(t.C_DWDM,1,2),t.Y_LXDM,t.Y_DBMC,t.Y_BWDM
 
 导入：
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL MODIFIED BY  COMPOUND=5 COMMITCOUNT 1000 insert into t_f_cig_month_sale
 db2 IMPORT FROM 't_f_cig_month_sale.del' OF DEL insert into t_f_cig_month_sale
 db2 IMPORT FROM 'E:\etlApp\exportdata\restore\t_b_buy_test_restore.del' OF DEL insert into t_b_buy_test_restore_bak
 ------------------------------
 
 --------解决
DatabaseMetaData.getTables方法时，抛出了如下的异常信息: 
COM.ibm.db2.jdbc.DB2Exception:   [IBM][CLI Driver][DB2/AIX64]   SQL0443N     例程   "SYSIBM.SQLTABLES "（特定名称   "TABLES "）返回了带诊断文本   "SYSIBM:CLI:-805 "   的错误   SQLSTATE。     SQLSTATE=38553 

db2 terminate
db2 CONNECT TO <dbname>
db2 BIND <path>/db2schema.bnd BLOCKING ALL GRANT PUBLIC sqlerror continue
db2 terminate
 
 
UPDATE hbyc.sd_order b SET b.bank_code=(select bank_code from   HBYC.MD_CUSTOMER_ACCOUNT t1 where  t1.IS_DEFAULT='1' and t1.CUST_ID=b.CUST_ID)
where COMPANY_ID='11421201' and ORDER_DATE='2014-11-17' and ( BANK_CODE='' or BANK_CODE is null)


数据库优化：读写分离（Q复制）

SELECT * FROM SYSCAT.TABLES WHERE TBSPACEID = 2 AND TABLEID = 252
SELECT * FROM SYSCAT.COLUMNS WHERE  TABNAME= 'HR_FLOW_INSTANCE_DETAIL' AND COLNO = 6

DB2常用的命令

db2 ? 42703
db2 ? sql811

db2expln -d db3 -q "select dict_code from zm.t_b_dict" -t

  ./ db2icrt -a 
1．启动数据库
db2start
2．停止数据库
db2stop
3．连接数据库
db2 connect to o_yd user db2 using pwd
4．读数据库管理程序配置
db2 get dbm cfg
5．写数据库管理程序配置
db2 update dbm cfg using 参数名 参数值
6．读数据库的配置
db2 connect to o_yd user db2 using pwd
db2 get db cfg for o_yd
7．写数据库的配置
db2 connect to o_yd user db2 using pwd
db2 update db cfg for o_yd using 参数名 参数值
8．关闭所有应用连接
db2 force application all
db2 force application ID1,ID2,,,Idn MODE ASYNC
(db2 list application for db o_yd show detail)
9．备份数据库
db2 force application all
db2 backup db o_yd to d:
(db2 initialize tape on \\.\tape0)
(db2 rewind tape on \\.\tape0)
db2 backup db o_yd to \.\tape0
10．恢复数据库
db2 restore db o_yd from d: to d: 
db2 restore db o_yd from \\.\tape0 to d:
db2 restore db loc_test from d:\DB_Bak taken at 20070305145246 to d:
11．绑定存储过程
db2 connect to o_yd user db2 using pwd
db2 bind c:\dfplus.bnd
拷贝存储过程到服务器上的C:\sqllib\function目录中
12．整理表
db2 connect to o_yd user db2 using pwd
db2 reorg table ydd
db2 runstats on table ydd with distribution and indexes all

13．导出表数据
db2 export to c:\dftz.txt of del select * from dftz
db2 export to c:\dftz.ixf of ixf select * from dftz
14．导入表数据
import from c:\123.txt of del insert into ylbx.czyxx

db2 import to c:\dftz.txt of del commitcount 5000 messages c:\dftz.msg insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 messages c:\dftz.msg insert into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 insert into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 insert_update into dftz

db2 import to c:\dftz.ixf of ixf commitcount 5000 replace into dftz
db2 import to c:\dftz.ixf of ixf commitcount 5000 create into dftz (仅IXF)
db2 import to c:\dftz.ixf of ixf commitcount 5000 replace_create into dftz (仅IXF)

15.db2move && db2look
导出DB：
		db2move dbName export -sn schemaName -tn tabName1,tabName2,tab3* -u userid -p password
		db2look -d dbName -e -a -o db2look.sql
导入DB：
		db2 create db dbName
		db2 -tvf db2look.sql
		db2move dbName import -io replace_create -u userid -p password
		db2 set integrity for prodinst.actor immediate checked --将表挂起状态改为正常状态
		
16．执行一个批处理文件
db2 –tf 批处理文件名
（文件中每一条命令用 ；结束）

17．自动生成批处理文件
建文本文件：temp.sql
select 'runstats on table DB2.' || tabname || ' with distribution and detailed indexes all;' from syscat.tables where tabschema='DB2' and type='T';
db2 –tf temp.sql>runstats.sql

18.表重命名
db2 rename table tta to rn_tab

17．自动生成建表（视图）语句
在服务器上：C:\sqllib\misc目录中
db2 connect to o_yd user db2 using pwd
db2look –d o_yd –u db2 –e –p –c c:\o_yd.txt

18．其他命令
grant dbadm on database to user bb
db2icrt   创建实例
db2idrop  删除实例
db2start  启动实例
db2stop   停止实例 

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

20. db2look –d ylbx –u db2admin –w –asd –a –e –o a.txt
db2look -d rone -i db2admin -w db2admin -l -m  -e -a -o rone.sql
21. 显示当前用户所有表 
　　list tables 
22.列出所有的系统表 
　　list tables for system
23.查看表结构 
　　db2 describe select * from user.tables


24.编目数据库
db2 catalog tcpip node jczhyw remote 10.68.116.12 server 50000
db2 catalog db HBADB_YW at node jczhyw

TO_CHAR (timestamp_expression_r,'YYY-MM-DD HH24:MI:SS')
TO_DATE (string_expression_r, 'YYY-MM-DD HH24:MI:SS')
