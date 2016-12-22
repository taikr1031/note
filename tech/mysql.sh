--更改登录用户密码  
update mysql.user set authentication_string=password('123') where user='root' and Host = 'localhost';

--卸载mysql
$ sudo apt-get autoremove --purge mysql-server mysql-client mysql-common
$ sudo apt-get remove --purge mysql* 
$ sudo apt-get autoremove mysql 
$ sudo apt-get autoclean mysql

$ sudo rpm -qi mysql-server		#查看mysql-server的版本
$ sudo service mysqld start 		#启动
$ sudo service mysqld restart		#重启
$ sudo chkconfig --list | grep mysqld		#查看mysql服务是不是开机自动启动
$ sudo chkconfig mysqld on				#设置成开机启动
$ sudo /usr/bin/mysqladmin -u root password 'root'		#为root账号设置密码

$ mysql -u root -proot	#进入mysql命令行
mysql> create database dubbo;