################################ 启动命令 ################################
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

################################################## 虚拟机配置 ##################################################
hostname: cent-d-01
user: user
password: admin
root password: 111111
address: 192.168.244.11
netmask: 255.255.255.0
gateway: 192.168.244.2
bcast:   192.168.244.255 

hostname: cent-s-02
user: root
password: 111111
address: 192.168.244.12
netmask: 255.255.255.0
gateway: 192.168.244.2
bcast:   192.168.244.255 

###SecureCRT终端美化
scheme: Traditional
font: Courier 10 Pitch

$df -hl
$yum -y install vim-enhanced

#通过pid查找进程全路经详细信息
$ top             #查找出某进程pid，如3612
$ cd /proc/3612   #进入该pid对应的文件夹
$ ls –ail         #列表结果中exe链接对应的就是可执行文件的全路经详细信息

###
$sudo vim /etc/profile
JAVA_HOME=/home/user/dev/
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


###QA
1.VMware新建虚拟机在选择安装镜像，选择"I will install the operating system later"，创建完后，硬件设置中设置安装镜像。否则可能会出现“This operating system will use Easy Install”导致安装完后，系统起不来