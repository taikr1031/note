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

ln -s /usr/lib/libfastcommon.so /usr/local/lib/libfastcommon.so
ln -s /usr/lib/libfastcommon.so /usr/lib/libfastcommon.so
ln -s /usr/lib/libfdfsclient.so /usr/local/lib/libfdfsclient.so
ln -s /usr/lib/libfdfsclient.so /usr/lib/libfdfsclient.so

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

/usr/local/nginx/sbin/nginx       				#启动nginx	http://192.168.244.14:8888/
/usr/local/nginx/sbin/nginx -s stop       #启动nginx
/usr/local/nginx/sbin/nginx -s reload     #启动nginx
/usr/local/nginx/sbin/nginx -v    				#查看nginx版本
/usr/local/nginx/sbin/nginx -t    				#检查配置文件ngnix.conf的正确性
ps -ef | grep nginx
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
./make.sh && ./make.sh install
#因为 FastDFS 主程序设置的 lib 目录是/usr/local/lib，所以需要创建软链接
ln -s /usr/lib64/libfastcommon.so /usr/local/lib/libfastcommon.so
ln -s /usr/lib64/libfastcommon.so /usr/lib/libfastcommon.so
ln -s /usr/lib64/libfdfsclient.so /usr/local/lib/libfdfsclient.so
ln -s /usr/lib64/libfdfsclient.so /usr/lib/libfdfsclient.so
#3.安装 FastDFS
cd /home/user/dev
tar -zxvf FastDFS_v5.05.tar.gz
cd FastDFS
./make.sh && ./make.sh install
cd /usr/bin/
ls | grep fdfs
#将两个脚本中的/usr/local/bin 修改成/usr/bin
vim /etc/init.d/fdfs_storaged   # :%s+/usr/local/bin+/usr/bin
vim /etc/init.d/fdfs_storaged   # :%s+/usr/local/bin+/usr/bin

###配置FastDFS跟踪器(192.168.4.121)
cd /etc/fdfs/
cp tracker.conf.sample tracker.conf
vim /etc/fdfs/tracker.conf
  disabled=false
  port=22122
  base_path=/fastdfs/tracker
mkdir -p /fastdfs/tracker
vi /etc/sysconfig/iptables  #添加如下端口行
  -A INPUT -m state --state NEW -m tcp -p tcp --dport 22122 -j ACCEPT
service iptables restart    #重启防火墙
/etc/init.d/fdfs_trackerd start/stop      #启动/停止 Tracker
ps -ef | grep fdfs                        #查看 FastDFS Tracker 是否已成功启动
/usr/bin/fdfs_upload_file /etc/fdfs/client.conf /root/install.log   #上传本地文件
/usr/bin/fdfs_monitor /etc/fdfs/client.conf  #监控
vi /etc/rc.d/rc.local   #设置 FastDFS 跟踪器开机启动，添加以下内容：
/etc/init.d/fdfs_trackerd start

###配置 FastDFS 存储
cd /etc/fdfs/
cp storage.conf.sample storage.conf
vim /etc/fdfs/storage.conf
mkdir -p /fastdfs/storage
vim /etc/sysconfig/iptables   #添加如下端口行
-A INPUT -m state --state NEW -m tcp -p tcp --dport 23000 -j ACCEPT
service iptables restart        #重启防火墙
/etc/init.d/fdfs_storaged start #启动 Storagevi 
vim /etc/rc.d/rc.local   #设置 FastDFS 跟踪器开机启动，添加以下内容：
  /etc/init.d/fdfs_storaged start
###文件上传测试。修改 Tracker 服务器中的客户端配置文件：
cp /etc/fdfs/client.conf.sample /etc/fdfs/client.conf
vim /etc/fdfs/client.conf
  base_path=/fastdfs/tracker
  tracker_server=192.168.4.121:22122
/usr/bin/fdfs_upload_file /etc/fdfs/client.conf /root/install.log   #上传本地文件
/usr/bin/fdfs_monitor /etc/fdfs/client.conf  #监控


################################################## 需要检查的文件 ##################################################
###All
vim /etc/init.d/fdfs_storaged   #/usr/local/bin 修改成/usr/bin
vim /etc/init.d/fdfs_trackerd   #/usr/local/bin 修改成/usr/bin 
###Tracker
vim /etc/fdfs/tracker.conf  #port=22122   base_path=/fastdfs/tracker
  store_group=group1   http.server_port=8080  
vim /etc/fdfs/client.conf #base_path=/fastdfs/tracker   tracker_server=192.168.244.12:22122   http.tracker_server_port=80
vim /etc/fdfs/storage.conf  #disabled=false   group_name=group1 port=23000 base_path=/fastdfs/storage  store_path0=/fastdfs/storage  tracker_server=192.168.244.12:22122   http.server_port=8888


修改8888:/etc/fdfs/storage.conf   /etc/fdfs/storage.conf
修改groupName:/etc/fdfs/storage.conf


################################################## 虚拟机配置 ##################################################
hostname: cent-d-11
user: user
password: admin
root password: 111111
address: 192.168.244.11
netmask: 255.255.255.0
gateway: 192.168.244.2
bcast:   192.168.244.255 
	tomcat-8.5.8[8080]	
	zookeeper-3.4.9[2181]	

hostname: cent-s-14
user: root
password: 111111
address: 192.168.244.14
netmask: 255.255.255.0
gateway: 192.168.244.2
bcast:   192.168.244.255 
	nginx-1.10.2[8888]
	fastdfs

hostname: cent-s-15
user: root
password: 111111
address: 192.168.244.15
netmask: 255.255.255.0
gateway: 192.168.244.2
bcast:   192.168.244.255 
	fastdfs
	
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
