rpm -ql *** 									#查找安装路径
sudo yum erase libreoffice\* 	#卸载 libreoffice
history | grep -i "varnish"		#查看历史执行命令
tracert www.baidu.com					
chkconfig --list 							#显示开机可以自动启动的服务
chkconfig --add iptables			#开机自动启动iptables服务；
chkconfig --del iptables			#开机禁止启动iptables服务；

###Tracker	Storage
yum -y install wget zip unzip
yum install zip unzip  

#yum install gcc* make*
yum install make cmake gcc gcc-c++	#编译和安装所需的依赖包
yum install libevent-devel
cd /usr/local/src
unzip libfastcommon-master.zip
cd libfastcommon-master
./make.sh && ./make.sh install

############################################ 软件安装 ############################################
#安装Apache
sudo yum install httpd httpd-devel
sudo vim /etc/selinux/config	#将SELINUX=enforcing 改为：SELINUX=disable  禁用SeLinux
sudo vim /etc/httpd/conf/httpd.conf
	ServerName 192.168.244.11:8055
	Listen 8055
sudo service httpd start
sudo chkconfig httpd on
sudo vim /etc/httpd/conf.d/subversion.conf #增加以下内容
	#Include /svn/httpd.conf
	<Location /svn/>
		DAV svn
		SVNListParentPath on
		SVNParentPath /home/user/dev/svn
		AuthType Basic
		AuthName "Subversion repositories"
		AuthUserFile /home/user/dev/svn/passwd.http
		AuthzSVNAccessFile /home/user/dev/svn/authz
		Require valid-user
	</Location>
	RedirectMatch ^(/svn)$ $1/
	
	touch /home/user/dev/svn/passwd.http
	touch /home/user/dev/svn/authz

#安装SVN
svnserve -d -r /home/user/dev/svn --listen-port 3391
ps -aux |grep svn  
kill -9 
svn://192.168.244.11/repo1
svn import big svn://192.168.244.11:3096/repo1/big -m "first import project"  
svn import big svn://192.168.244.11/repo1/big -m "first import project" 


#安装Nginx
tar -zxvf nginx-1.10.2.tar.gz
cd /home/user/dev/nginx-1.10.2
./configure --prefix=/home/user/dev/nginx --with-http_stub_status_module --with-http_ssl_module
make && make install
cd /home/user/dev/nginx/sbin
rm -rf /home/user/dev/nginx-1.10.2
/home/user/dev/nginx/sbin/nginx -v    					#查看nginx版本
sudo /home/user/dev/nginx/sbin/nginx -t    			#检查配置文件ngnix.conf的正确性
vim /home/user/dev/nginx/conf/nginx.conf				#权限问题导致Nginx 403 Forbidden错误
	#将第一行的 #user nobody 改成 user user(后面的 user 是当前登录用户名)
sudo vim /etc/rc.d/rc.local   									#设置 Nginx 开机自动启动，添加以下内容：
	su - root -c '/home/user/dev/nginx/sbin/nginx'
	#su - user -c '/home/user/dev/zookeeper/bin/zkServer.sh start'
	#su - user -c '/home/user/dev/tomcat/bin/startup.sh'
sudo reboot																			#机器重启
sudo /home/user/dev/nginx/sbin/nginx       			#启动nginx	http://192.168.244.14:8888/
sudo /home/user/dev/nginx/sbin/nginx -s reload  #重启nginx
sudo /home/user/dev/nginx/sbin/nginx -s stop    #关闭nginx
ps -ef | grep nginx

#安装Varnish
sudo yum install libedit-dev*
export PKG_CONFIG_PATH=/usr/local/pcre/lib/pkgconfig
tar -zxvf /home/user/dev/varnish-4.1.4.tar.gz
cd /home/user/dev/varnish-4.1.4
sudo yum install python-docutils
./configure --prefix=/home/user/dev/varnish
make && make install
cd /home/user/dev/varnish
mkdir -p /home/user/dev/varnish/etc/varnish
将 default.vcl 编辑后放到 /home/user/dev/varnish/etc/varnish 目录下
/home/user/dev/varnish/sbin/varnishd -f /home/user/dev/varnish/etc/varnish/default.vcl -s malloc,32M -T 127.0.0.1:2000 -a 0.0.0.0:1111	#启动
cd /home/user/dev/varnish/sbin
pkill varnished	#停止
/home/user/dev/varnish/bin/varnishlog	#健康检查

#启动Tomcat
/home/user/dev/tomcat8.5.8/bin/startup.sh
/home/user/dev/tomcat8.5.8/bin/shutdown.sh
/home/user/dev/tomcat/bin/version.sh 	#查看版本信息
#安装OpenSsl 1.1.0
wget https://www.openssl.org/source/openssl-1.1.0-latest.tar.gz
tar -zxvf openssl-1.1.0-latest.tar.gz
cd openssl-1.1.0c
./config --prefix=/home/user/dev/openssl -fPIC
make && make install
sudo /home/user/dev/openssl/bin/openssl /usr/bin/
sudo mv /usr/bin/openssl ~
sudo ln -s /home/user/dev/openssl/bin/openssl /usr/bin/openssl
openssl version
sudo rm -rf /usr/lib64/libssl.so.1.1
sudo rm -rf /usr/lib64/libcrypto.so.1.1
sudo ln -s /home/user/dev/openssl/lib/libssl.so.1.1 /usr/lib64/libssl.so.1.1
sudo ln -s /home/user/dev/openssl/lib/libcrypto.so.1.1 /usr/lib64/libcrypto.so.1.1
/home/user/dev/openssl/bin/openssl version

wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-connectors/native/1.1.34/source/tomcat-native-1.1.34-src.tar.gz
上面的gz包下载下来之后，放到Tomcat的bin目录下去，解压，进入目录
cd /home/user/dev/tomcat/bin/tomcat-native-1.1.34-src/jni/native

#安装apr
./configure --prefix=/home/user/dev/apr
make && make install
./configure --prefix=/home/user/dev/apr-iconv --with-apr=/home/user/dev/apr
make && make install
./configure --prefix=/home/user/dev/apr-util --with-apr=/home/user/dev/apr --with-apr-iconv=/home/user/dev/apr-iconv/bin/apriconv
make && make install
cd /home/user/dev/tomcat/bin
wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-connectors/native/1.2.10/source/tomcat-native-1.2.10-src.tar.gz
tar -zxvf tomcat-native-1.1.34-src.tar.gz
cd /home/user/dev/tomcat/bin/tomcat-native-1.2.10-src/jni/native
./configure --with-apr=/home/user/dev/apr --with-ssl-dir=/home/user/dev/openssl --with-java-home=$JAVA_HOME --with-openssl-includes=/usr/include
make && make install
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/dev/apr/lib export LD_LIBRARY_PATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/user/dev/apr/lib

#安装MemCached
cd /home/user/dev/libevent-2.0.22-stable
./configure --prefix=/home/user/dev/libevent 
make && make install
cd /home/user/dev/memcached-1.4.33
./configure --prefix=/home/user/dev/memcached --with-libevent=/home/user/dev/libevent/
make && make install
#启动MemCached
/home/user/dev/memcached/bin/memcached -d -m 10 -u user -l 192.168.244.11 -p 2222 -c 256 -P /tmp/memcached.pid
#关闭Memcached
ps aux|grep memcached
kill -9 ***
############################################ 软件安装 ############################################

#测试(Nginx、Varnish、Tomcat)
http://192.168.244.11				#Nginx
http://192.168.244.11:1111	#Varnish
http://192.168.244.11:8080	#Tomcat
http://www.taikr.com				#Windows的hosts：192.168.244.11 cent-d-11 www.taikr.com
http://www.taikr.com:1111		#Windows的hosts：192.168.244.11 cent-d-11 www.taikr.com
http://www.taikr.com:8080		#Windows的hosts：192.168.244.11 cent-d-11 www.taikr.com

ln -s /usr/lib/libfastcommon.so /usr/local/lib/libfastcommon.so
ln -s /usr/lib/libfastcommon.so /usr/lib/libfastcommon.so
ln -s /usr/lib/libfdfsclient.so /usr/local/lib/libfdfsclient.so
ln -s /usr/lib/libfdfsclient.so /usr/lib/libfdfsclient.so

################################ ActiveMQ ################################
/home/user/dev/activemq/bin/activemq start
/home/user/dev/activemq/bin/activemq stop
http://192.168.244.11:8161/admin	username:admin	password:admin


################################ Zookeeper ################################
$ sudo vim /etc/hosts
	127.0.0.1               localhost.localdomain localhost
	::1             localhost6.localdomain6 localhost6
	192.168.244.11 cent-d-11
	192.168.244.14 cent-s-14
	192.168.244.15 cent-s-15
$ tar -zxvf /home/user/dev/zookeeper-3.4.9.tar.gz
$ mv /home/user/dev/zookeeper-3.4.9 /home/user/dev/zookeeper
$ cd /home/user/dev/zookeeper
$ mkdir data
$ mkdir logs
$ cp /home/user/dev/zookeeper/conf/zoo_sample.cfg /home/user/dev/zookeeper/conf/zoo.cfg
$ vim /home/user/dev/zookeeper/conf/zoo.cfg
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/home/user/dev/zookeeper/data
dataLogDir=/home/user/dev/zookeeper/logs
clientPort=2181
server.1=cent-d-11:2888:3888
$ vim /home/user/dev/zookeeper/data/myid
1
$ sudo vim /etc/profile		#增加 zookeeper 配置
JAVA_HOME=/home/user/dev/jdk1.8.0/
PATH=$JAVA_HOME/bin:$PATH
CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
export JAVA_HOME
export PATH
export CLASSPATH
export ZOOKEEPER_HOM=/home/user/dev/zookeeper
export PATH=$ZOOKEEPER_HOME/bin:$PATH
$ source /etc/profile		#使配置文件生效
$ sudo vim /etc/sysconfig/iptables	#增加
-A INPUT -m state --state NEW -m tcp -p tcp --dport 2181 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 2888 -j ACCEPT
-A INPUT -m state --state NEW -m tcp -p tcp --dport 3888 -j ACCEPT
$ sudo service iptables restart		#重启防火墙
$ service iptables status	#查看防火墙端口状态
$ /home/user/dev/zookeeper/bin/zkServer.sh start
$ jps
1456 QuorumPeerMain
1475 Jps
$ /home/user/dev/zookeeper/bin/zkServer.sh status
$ /home/user/dev/zookeeper/bin/zkServer.sh stop
$ sudo vim /etc/rc.local	#配置zookeeper开机使用user用户启动，增加
su - user -c '/home/user/dev/zookeeper/bin/zkServer.sh start'

################################ 安装Dubbo管理控制 ################################
$ tar -zxvf /home/user/dev/apache-tomcat-8.5.8.tar.gz
$ mv /home/user/dev/apache-tomcat-8.5.8 /home/user/dev/tomcat
$ rm -rf /home/user/dev/tomcat/webapps/ *
$ mv /home/user/dev/tomcat/webapps/dubbo-admin-2.8.4 /home/user/dev/tomcat/webapps/ROOT
$ vim /home/user/dev/tomcat/webapps/ROOT/WEB-INF/dubbo.properties
dubbo.registry.address=zookeeper://192.168.244.11:2181
dubbo.admin.root.password=guest
dubbo.admin.guest.password=guest
$ sudo vim /etc/sysconfig/iptables	#增加
-A INPUT -m state --state NEW -m tcp -p tcp --dport 8080 -j ACCEPT
$ sudo service iptables restart		#重启防火墙
$ sudo vim /etc/rc.local	#配置tomat开机使用user用户启动，增加
su - user -c '/home/user/dev/tomcat/bin/startup.sh'
#http://192.168.244.11:8080/	guest	guest

################################ 启动命令 ################################
### 192.168.244.11  cent-d-01
$ sudo service iptables stop
$ /home/user/dev/zookeeper-3.4.9/bin/zkServer.sh start

$ /home/user/dev/activemp-01/bin/activemq start
  http://192.168.244.11:8161
  username:admin   password:admin

$ /home/user/dev/tomcat8.5.8/bin/startup.sh
$ /home/user/dev/tomcat8.5.8/bin/shutdown.sh
$ tail -f /home/user/dev/tomcat8.5.8/logs/catalina.out
  http://192.168.244.11:8080
  username:guest   password:guest
  
### 192.168.244.12  cent-s-02
service iptables stop
#redis  auth:123456
service redis start/stop                  #启动redis服务
/home/user/dev/redis-3.2.5/bin/redis-cli  #启动redis客户端

/etc/init.d/fdfs_trackerd start/stop      #启动/停止 Tracker
ps -ef | grep fdfs                        #查看 FastDFS Tracker 是否已成功启动
/usr/bin/fdfs_upload_file /etc/fdfs/client.conf /root/install.log   #上传本地文件
/usr/bin/fdfs_monitor /etc/fdfs/client.conf  #监控

### 192.168.244.13  cent-s-03
/etc/init.d/fdfs_storaged start/stop   		#启动/停止 Storage
cd /fastdfs/storage/data/00/00    				#查看上传文件

http://192.168.244.12:8888/group1/M00/00/00/wKj0DVhALF-AJUz5AAAdwblCcDQ394.log
http://192.168.244.13:8888/group1/M00/00/00/wKj0DVhAjr6AOsAgAAANOE6_0rQ.syslog

################################################## fastdfs + nginx ##################################################
###所有跟踪服务器和存储服务器均执行
rm -rf FastDFS
rm -rf libfastcommon-master
#1.编译和安装所需的依赖包
yum install make cmake gcc gcc-c++
#2.安装 libfastcommon
cd /home/user/dev
unzip libfastcommon-master.zip
cd libfastcommon-master
#编译、安装。libfastcommon 默认安装到了，/usr/lib/libfastcommon.so，/usr/lib64/libfdfsclient.so
sudo ./make.sh && sudo ./make.sh install
#因为 FastDFS 主程序设置的 lib 目录是/usr/local/lib，所以需要创建软链接
sudo ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so
sudo ln -s /usr/lib64/libfastcommon.so /usr/lib/libfastcommon.so
sudo ln -s /usr/lib64/libfdfsclient.so /usr/local/lib/libfdfsclient.so
sudo ln -s /usr/lib64/libfdfsclient.so /usr/lib/libfdfsclient.so
#3.安装 FastDFS
cd /home/user/dev
tar -zxvf FastDFS_v5.05.tar.gz
cd FastDFS
sudo ./make.sh && sudo ./make.sh install
cd /usr/bin/
ls | grep fdfs
#将两个脚本中的/usr/local/bin 修改成/usr/bin
sudo vim /etc/init.d/fdfs_trackerd   # :%s+/usr/local/bin+/usr/bin
sudo vim /etc/init.d/fdfs_storaged   # :%s+/usr/local/bin+/usr/bin

###配置FastDFS跟踪器(192.168.4.121)
cd /etc/fdfs/
sudo cp tracker.conf.sample tracker.conf
sudo vim /etc/fdfs/tracker.conf
  disabled=false
  port=22122
  base_path=/fastdfs/tracker
sudo mkdir -p /fastdfs/tracker
sudo vim /etc/sysconfig/iptables  											#添加如下端口行
  -A INPUT -m state --state NEW -m tcp -p tcp --dport 22122 -j ACCEPT
sudo service iptables restart    												#重启防火墙
sudo /etc/init.d/fdfs_trackerd start/stop      					#启动/停止 Tracker
ps -ef | grep fdfs                        							#查看 FastDFS Tracker 是否已成功启动
/usr/bin/fdfs_upload_file /etc/fdfs/client.conf /root/install.log   #上传本地文件
/usr/bin/fdfs_monitor /etc/fdfs/client.conf  						#监控
sudo vim /etc/rc.d/rc.local   													#设置 FastDFS 跟踪器开机启动，添加以下内容：
  su - root -c 'sudo /etc/init.d/fdfs_trackerd start'

###配置 FastDFS 存储
cd /etc/fdfs/
sudo cp storage.conf.sample storage.conf
sudo vim /etc/fdfs/storage.conf
	base_path=/fastdfs/storage
	store_path0=/fastdfs/storage
	tracker_server=192.168.4.121:22122
	http.server_port=80  #8888
sudo mkdir -p /fastdfs/storage
sudo vim /etc/sysconfig/iptables   											#添加如下端口行
-A INPUT -m state --state NEW -m tcp -p tcp --dport 23000 -j ACCEPT
sudo service iptables restart        										#重启防火墙
sudo /etc/init.d/fdfs_storaged start 										#启动 Storagevi 
sudo vim /etc/rc.d/rc.local   													#设置 FastDFS 跟踪器开机启动，添加以下内容：
	su - root -c 'sudo /etc/init.d/fdfs_storaged start'
###文件上传测试。修改 Tracker 服务器中的客户端配置文件：
sudo cp /etc/fdfs/client.conf.sample /etc/fdfs/client.conf
sudo vim /etc/fdfs/client.conf
  base_path=/fastdfs/tracker
  tracker_server=192.168.4.121:22122
sudo /usr/bin/fdfs_upload_file /etc/fdfs/client.conf /home/user/zookeeper.out   #上传本地文件
sudo /usr/bin/fdfs_monitor /etc/fdfs/client.conf  #监控

###配置Nginx
tar -zxvf fastdfs-nginx-module_v1.16.tar.gz
cd fastdfs-nginx-module/src
sudo vim config
	#CORE_INCS="$CORE_INCS /usr/local/include/fastdfs /usr/local/include/fastcommon/"		#注释
	CORE_INCS="$CORE_INCS /usr/include/fastdfs /usr/include/fastcommon/"								#增加
#安装Nginx
sudo yum install gcc gcc-c++ make automake autoconf libtool pcre* zlib openssl openssl-devel
tar -zxvf nginx-1.6.2.tar.gz
cd /home/user/dev/nginx-1.6.2
/home/user/dev/nginx-1.6.2/configure --prefix=/home/user/dev/nginx --add-module=/home/user/dev/fastdfs-nginx-module/src
./make.sh && ./make.sh install
cd /home/user/dev/nginx
#安装fastdfs-nginx-module
sudo cp /home/user/dev/fastdfs-nginx-module/src/mod_fastdfs.conf /etc/fdfs/
sudo vim /etc/fdfs/mod_fastdfs.conf
	connect_timeout=10
	base_path=/tmp
	tracker_server=192.168.244.11:22122
	storage_server_port=23000
	group_name=group1
	url_have_group_name = true
	store_path0=/fastdfs/storage
cd /home/user/dev/FastDFS/conf
sudo cp /home/user/dev/FastDFS/conf/http.conf mime.types /etc/fdfs/
sudo ln -s /fastdfs/storage/data/ /fastdfs/storage/data/M00
sudo vim /home/user/dev/nginx/conf/nginx.conf
	***
sudo /home/user/dev/nginx/sbin/nginx	#启动Nginx
#测试Nginx和FastDFS
sudo /usr/bin/fdfs_upload_file /etc/fdfs/client.conf /etc/hosts	#/etc/hosts 是任意待上传文件名
group1/M00/00/00/wKj0C1h2MiuACzDnAAA2WcXTFg8755
http://192.168.244.11/group1/M00/00/00/wKj0C1h2MiuACzDnAAA2WcXTFg8755
http://192.168.244.11/group1/M00/00/00/wKj0C1h3L_yAdFP1AA1rIuRd3Es209.jpg
################################################## fastdfs + nginx ##################################################

###SecureCRT终端美化
scheme: Traditional
font: Courier 10 Pitch

$df -hl
$yum -y install vim-enhanced

#修改IP主机名
$ sudo vim /etc/udev/rules.d/70-persistent-net.rules
$ sudo vim /etc/sysconfig/network-scripts/ifcfg-eth0
$ sudo vim /etc/sysconfig/network
$ sudo vim /etc/hosts

#通过pid查找进程全路经详细信息
$ top             #查找出某进程pid，如3612
$ cd /proc/3612   #进入该pid对应的文件夹
$ ls –ail         #列表结果中exe链接对应的就是可执行文件的全路经详细信息
$ sudo fuser -k 80/tcp  #关闭占用80端口的程序

$ netstat -ntpl 
$ netstat -ano |grep 8080
$ ps -ef | grep fdfs

################################################## 装机 ##################################################
yum -y install wget zip unzip
vim /etc/profile
	JAVA_HOME=/home/user/dev/jdk1.8.0/
	PATH=$JAVA_HOME/bin:$PATH
	CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
	export JAVA_HOME
	export PATH
	export CLASSPATH
	
#CentOS卸载系统自带的OpenJDK
$ rpm -qa | grep jdk
java-1.6.0-openjdk-1.6.0.0-1.45.1.11.1.el6.i686 
$ yum -y remove java-1.6.0-openjdk-1.6.0.0-1.45.1.11.1.el6.i686

###ssh
$ sudo yum install openssh-server     #安装ssh
$ sudo service sshd restart           #重启SSH服务
$ sudo chkconfig sshd on              #设置SSH服务为开机启动
$ sudo netstat -antp | grep sshd      #查看是否启动22端口

$ scp -r /home/user/dev/jdk1.8.0_111/ root@cent-s-02:/root/dev

rz -y #在命令行中打开文件选择对话框，选择复制粘贴的文件

################################ Hadoop Server ################################
VMWARE：
控制面板-服务：启动VMware NAT Service服务
IP设置：参照虚拟机-》Edit-》Virtual Network Editor 中的 NAT 中的 subnet IP 和 Subnet mask
192.168.244.7
255.255.255.0
192.168.244.2

202.103.24.68

cent01：3G内存、4核、20G硬盘
cent02：2G内存、1核、10G硬盘
cent02：2G内存、1核、10G硬盘
cent04：2G内存、1核、10G硬盘
cent05：2G内存、1核、10G硬盘
cent06：2G内存、1核、10G硬盘


###FQA
1.VMware新建虚拟机在选择安装镜像，选择"I will install the operating system later"，创建完后，硬件设置中设置安装镜像。否则可能会出现“This operating system will use Easy Install”导致安装完后，系统起不来
2.vi或者vim文件加密和乱码的处理：vim存盘可能不小心按了:X，提示Enter encryption key
vim file
Enter encryption key: 输入密码
:set key= 
:x

3.could not bind to address no listening sockets available shutting down
	发现是SELinux在作怪，查看SElinux使用状态
	#getenforce
	Enforcing 	#SElinux未禁用。
	1.临时禁用：sudo setenforce 0
	2.永久禁用：sudo vim /etc/selinux/config	#将SELINUX=enforcing 改为：SELINUX=disable  禁用SeLinux

