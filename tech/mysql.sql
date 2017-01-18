--更改登录用户密码  
update mysql.user set authentication_string=password('123') where user='root' and Host = 'localhost';

--备份数据库
mysqldump -u xxx -h xxx -P 3306 -p --all-databases > databases.sql
--查看启动日志
tail -n 200 mysqld.log

rm ibdata1  ib_logfile0  ib_logfile1 

--卸载mysql
$ sudo apt-get autoremove --purge mysql-server mysql-client mysql-common
$ sudo apt-get remove --purge mysql* 
$ sudo apt-get autoremove mysql 
$ sudo apt-get autoclean mysql

$ sudo rpm -qi mysql-server			#查看mysql-server的版本
$ sudo service mysqld start 		#启动
$ sudo service mysqld restart		#重启
$ sudo chkconfig --list | grep mysqld		#查看mysql服务是不是开机自动启动
$ sudo chkconfig mysqld on				#设置成开机启动
$ sudo /usr/bin/mysqladmin -u root password 'root'		#为root账号设置密码

$ mysql -u root -proot	#进入mysql命令行
mysql> create database dubbo;


FAQ:
1.SQLException: null, message from server: “Host ‘xxx’ is not allowed to connect 安装了数据库的服务器不允许进行远程连接
	mysql> use mysql;
	mysql> select host, user, password from user;
	--可以看到user为root，host为localhost的话，说明mysql只允许本机连接，那么外网，本地软件客户端就无法连接了。
	mysql> update user set host='%' where user='root' and host='localhost';
	mysql> flush privileges;

2.centos Access denied for user 'root'@'localhost' (using password: YES)
	$ sudo service mysqld stop
	$ sudo mysqld_safe --skip-grant-tables &
	--新开起一个终端无需密码进入
	$ mysql -uroot
	mysql> use mysql;
	mysql> delete from user where USER='';
	mysql> FLUSH PRIVILEGES; --记得要这句话，否则如果关闭先前的终端，又会出现原来的错误
	mysql> \q
	$ sudo service httpd restart
	
3.rpm包安装mysql5.6不能启动
	$ cd /var/lib/mysql
	$ sudo rm ibdata1  ib_logfile0  ib_logfile1 
	$ sudo service mysqld start