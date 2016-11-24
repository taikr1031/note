--进入mysql
mysql -u root -proot

--更改登录用户密码  
update mysql.user set authentication_string=password('123') where user='root' and Host = 'localhost';

--卸载mysql
sudo apt-get autoremove --purge mysql-server mysql-client mysql-common
sudo apt-get remove --purge mysql* 
sudo apt-get autoremove mysql 
sudo apt-get autoclean mysql