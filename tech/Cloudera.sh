hadoop-1.1.2
hbase-0.94.9
zookeeper-3.3.5
hive-0.10.0

启动hbase的顺序：Hadoop-》zookeeper-》hbase
停止zookeeper的顺序：Hbase-》zookeeper-》hadoop

启动：
~/hadoop/bin/start-all.sh
~/zookeeper/bin/zkServer.sh start
~/hbase/bin/start-hbase.sh
 
停止：
~/hbase/bin/stop-hbase.sh
~/zookeeper/bin/zkServer.sh stop
~/hadoop/bin/stop-all.sh

hadoop@hadoop-01:~$ jps #Hadoop 相关共8个进程
3905 JobTracker
4275 TaskTracker
3105 NameNode
3825 SecondaryNameNode
3462 DataNode
6391 HQuorumPeer
6458 HMaster
6854 HRegionServer
5042 QuorumPeerMain
8827 Jps

http://localhost:50070
http://localhost:50030
HBase Master web界面：http://hadoop-01:60010
HBase RegionServer web界面：http://hadoop-01:60030

~/hadoop/bin/hadoop jar ~/a/wordcount.jar /user/hadoop/dfs/1/SystemOut.log /user/hadoop/dfs/output
~/hadoop/bin/hadoop jar ~/a/HbaseConnection.jar

MySql：
mysql -uroot -proot
mysql -uhive -phive
create database hive;

GRANT ALL ON hive.* to hive@'%' IDENTIFIED BY 'hive';
GRANT ALL ON hive.* to hive@localhost IDENTIFIED BY 'hive';
create user 'hive'@'localhost' identified by 'hive';
grant all privileges on *.* to 'hive'@'localhost' with grant option;

/*********************************************************通过Sqoop将MySql/DB2数据导入Hadoop*****************************************************/
~/sqoop/bin/sqoop import --connect jdbc:mysql://localhost/hive --username hive --password hive --table CDS --verbose --target-dir /user/hadoop/sqoopdir  --fields-terminated-by '\0001'  

~/sqoop/bin/sqoop import --connect jdbc:mysql://localhost/hive --username hive --password hive --table CDS --verbose --target-dir /user/hadoop/sqoopdir2 --direct

$SQOOP_HOME/bin/sqoop import --driver com.ibm.db2.jcc.DB2Driver --connect jdbc:db2://10.70.128.144:50000/esspdb --username essp --password essp --table T_S_P_USER_BAK --split-by USER_ID --target-dir /user/hadoop/sqoopdir/3 -m 1
~/hadoop/bin/hadoop fs -ls /user/hadoop/sqoopdir/3
~/hadoop/bin/hadoop fs -text /user/hadoop/sqoopdir/3/part-m-00000

$SQOOP_HOME/bin/sqoop export --driver com.ibm.db2.jcc.DB2Driver --connect jdbc:db2://10.70.128.144:50000/esspdb --username essp --password essp --table 'essp'.'T_S_P_USER_BAK_1' --export-dir /user/hadoop/sqoopdir/3/ -m 1
SQL：SELECT * FROM T_S_P_USER_BAK_1

/***********************************************************通过Sqoop将DB2数据导入Hbase**********************************************************/
$SQOOP_HOME/bin/sqoop import --driver com.ibm.db2.jcc.DB2Driver --connect jdbc:db2://10.70.128.144:50000/esspdb --table T_S_P_USER_BAK --username essp --password essp -m 1 --hbase-create-table --hbase-table T_S_P_USER_HBASE --hbase-row-key USER_ID --column-family USER_FAM

create 'test', 'cf'
list 'table'
scan 'T_S_P_USER_HBASE'

/***********************************************************通过Sqoop将DB2数据导入Hive**********************************************************/
$SQOOP_HOME/bin/sqoop create-hive-table --driver com.ibm.db2.jcc.DB2Driver --connect jdbc:db2://10.70.128.144:50000/esspdb --table T_S_P_USER_BAK_1 --username essp --password essp --verbose

hadoop@hadoop-01:~$ jps # HBASE_MANAGES_ZK=true
8117 Jps
7514 HMaster
6810 SecondaryNameNode
6899 JobTracker
6091 NameNode
7254 TaskTracker
6446 DataNode



wget http://apache.mirrors.tds.net/hadoop/common/hadoop-0.23.8/hadoop-0.23.8.tar.gz
tar -zxvf hadoop-2.0.3-alpha.tar.gz

gedit /home/hadoop/hadoop/etc/hadoop/core-site.xml
gedit /home/hadoop/hadoop/etc/hadoop/hdfs-site.xml
gedit /home/hadoop/hadoop/etc/hadoop/yarn-site.xml
gedit /home/hadoop/hadoop/etc/hadoop/slaves

sudo mkdir /logs
sudo chmod -R 777 /logs
sudo chown -R hadoop:hadoop /logs


~/hadoop/bin/hadoop namenode -format
~/hadoop/sbin/start-dfs.sh
~/hadoop/sbin/start-yarn.sh
sudo update-alternatives --install /usr/bin/jps jps /usr/lib/jvm/jdk1.7.0_21/bin/jps 1
sudo jps
http://localhost:8088
分布式文件系统 Web 监控：http://localhost:50070
http://localhost:50075/browseDirectory.jsp
~/hadoop/bin/hadoop jar /home/hadoop/hadoop/share/hadoop/mapreduce/hadoop-mapreduce-examples-0.23.8.jar pi 20 10
~/hadoop/sbin/stop-all.sh

在新一代的Hadoop里面HDFS称为了统一存储的平台，而YARN成为了统一计算的平台。
（1）调用start-dfs.sh启动HDFS。之后JPS会出现NameNode,DataNode,SecondaryNameNode
（2）调用start-yarn.sh启动YARN。之后JPS会出现ResourceManager,NodeManager

DataNode 无法启动：
~/hadoop/sbin/stop-dfs.sh
~/hadoop/sbin/stop-yarn.sh
jps #所有进程全杀
~/hadoop/bin/hadoop fs -rmr /tmp
rm -rf /tmp/hadoop*
rm -r ~/hadoop/hdfs/
~/hadoop/bin/hadoop namenode -format
~/hadoop/sbin/start-dfs.sh
~/hadoop/sbin/start-yarn.sh

################################################################################################################
http://wiki.ubuntu.org.cn/%E5%88%A9%E7%94%A8Cloudera%E5%AE%9E%E7%8E%B0Hadoop
一、前期准备工作
groupadd hadoop #创建hadoop用户，用户组
useradd -s /bin/bash -g hadoop -G root -d /home/hadoop -m hadoop
sudo ufw disable #关闭防火墙
sudo passwd root #修改root密码
su - root #以root用户登入系统
sudo gedit /etc/sudoers   #找到 rootALL=(ALL:ALL) ALL，在它下面添加一行：hadoop  ALL=(ALL:ALL) ALL
su - hadoop #以hadoop用户登入系统
调整系统当前时区为上海，并根据网络时间自动更新
设置静态IP
sudo chmod -R 777 cloudera-manager-installer.bin
sudo ./cloudera-manager-installer.bin

二、设置JAVA_HOME
#安装JAVA，配置环境变量
将 jdk-7u21-linux-x64.tar.gz 文件拷贝到 home 根目录
tar -zxvf jdk-7u21-linux-x64.tar.gz
sudo cp -a ~/jdk1.7.0_21/ /usr/lib/jvm/
sudo chmod -R 777 /usr/lib/jvm/jdk1.7.0_21
sudo gedit /etc/environment
	PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/lib/jvm/jdk1.7.0_21"
	CLASSPATH="/usr/lib/jvm/jdk1.7.0_21/lib"
	JAVA_HOME="/usr/lib/jvm/jdk1.7.0_21"
#修改默认JDK
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk1.7.0_21/bin/java 300
sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk1.7.0_21/bin/javac 300
sudo update-alternatives --config java  
#检查JAVA_HOME环境变量
echo $JAVA_HOME
sudo env | grep JAVA_HOME
alias jps='/usr/lib/jvm/jdk1.7.0_21/lib/bin/jps'
sudo update-alternatives --install /usr/bin/jps jps /usr/lib/jvm/jdk1.7.0_21/bin/jps 1   #处理 jps 命令问题
sudo jps

三、设置Cloudera的源
sudo gedit /etc/apt/sources.list.d/cloudera.list
	deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib
	deb-src http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib
sudo apt-get install curl
curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -

四、安装Hadoop
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install -f hadoop-conf-pseudo
dpkg -L hadoop-conf-pseudo

五、SSH设置
#Hadoop要求所有机器上hadoop的部署目录结构要相同，并且都有一个相同用户名的帐户。由于这里采用的是Cloudera发布的Hadoop包，所以并不需要这方面的设置，大家了解一下即可。
sudo apt-get install ssh
ssh-keygen -t rsa && cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod -R 700 ~/.ssh && sudo chmod -R 600 ~/.ssh/authorized_keys
sudo gedit /etc/ssh/sshd_config   #找到以下内容，并去掉注释符”#“
	RSAAuthentication yes
    PubkeyAuthentication yes
    AuthorizedKeysFile	%h/.ssh/authorized_keys
scp /home/hadoop/.ssh/authorized_keys hadoop-02:/home/hadoop/.ssh/
scp /home/hadoop/.ssh/authorized_keys hadoop-03:/home/hadoop/.ssh/

sudo gedit /etc/hosts   #删除原有的 /etc/hosts 文件中有将本机计算机名解析为 127.0.1.1 的字段，例如：127.0.1.1 hadoop-01。每一台机器都要维护
	127.0.0.1 localhost
	192.168.1.211 hadoop-01
	192.168.1.212 hadoop-02
	192.168.1.213 hadoop-03
ssh hadoop-01	
ssh hadoop-02
ssh hadoop-03

六、设置主节点的Hadoop
sudo gedit /etc/hadoop/conf/hadoop-env.sh   #设置Hadoop的JAVA_HOME
	export JAVA_HOME=/usr/lib/jvm/jdk1.7.0_21
#修改Hadoop的核心配置，以下所有文件中的 localhost  全部改为 hadoop-01
sudo gedit /etc/hadoop/conf/core-site.xml
sudo gedit /etc/hadoop/conf/hdfs-site.xml
sudo gedit /etc/hadoop/conf/mapred-site.xml
#设置Hadoop的主从节点
sudo gedit /etc/hadoop/conf/masters   #设置主节点
	hadoop-01
sudo gedit /etc/hadoop/conf/slaves    #设置从节点
	hadoop-02
	hadoop-03

七、设置从节点上的Hadoop
#从节点上的Hadoop设置很简单，只需要将主节点上的Hadoop设置，复制一份到从节点上即可
sudo scp -r /etc/hadoop/conf hadoop-02:/etc/hadoop   #提示root密码，输入root
sudo scp -r /etc/hadoop/conf hadoop-03:/etc/hadoop   #提示root密码，输入root

八、启动Hadoop
sudo -u hdfs hdfs namenode -format   #格式化分布式文件系统，只需要在主节点做就行了
#hadoop namenode -format   #格式化分布式文件系统，只需要在主节点做就行了
cd
sudo gedit ~/hadoop-hdfs-start   #编辑启动文件
	#!/bin/bash
	for service in /etc/init.d/hadoop-hdfs-*
	do
	sudo $service start
	done
sudo chmod +x ~/hadoop-hdfs-start
~/hadoop-start   #启动 hadoop
#测试启动是否成功
http://localhost:50070
http://localhost:50030
cd /usr/lib/jvm/jdk1.7.0_21/bin/
./jps
/usr/bin$ hadoop fs -ls 

VMmare clone系统启动后修改项：
1、full clone
2、Edit virtual machine settings -> Network Adapter -> Custom: Specific virtual network -> VMnet0
3、Advanced...   #修改MAC Address
4、sudo gedit /etc/hostname   #修改主机名
5、sudo usermod old -l new #修改主用户名
6、Edit Connections... 设置IPv4的IP，并修改MAC Address

About the HDFS filesystem
#fs 根目录只能用 hdfs，子目录任意组名、用户名
hadoop fs -ls /
sudo -u hdfs hadoop fs -mkdir /tmp && sudo -u hdfs hadoop fs -chmod -R 1777 /tmp

sudo -u hdfs hadoop fs -mkdir /user/hadoop/input && sudo -u hdfs hadoop fs -chown -R hadoop:hadoop /user/hadoop/input

sudo -u hdfs hadoop fs -mkdir /output && sudo -u hdfs hadoop fs -chown -R hadoop:hadoop /output

sudo -u hdfs hadoop fs -mkdir /var/log/hadoop-yarn && sudo -u hdfs hadoop fs -chmod -R 1777 /var/log/hadoop-yarn && sudo -u hdfs hadoop fs -chown -R hadoop:hadoop /var/log/hadoop-yarn

sudo -u hdfs hadoop fs -mkdir /tmp/hadoop-yarn/staging && sudo -u hdfs hadoop fs -chown -R hadoop:hadoop /user/hadoop

sudo -u hdfs hadoop fs -mkdir /tmp/hadoop-yarn/staging/history/done_intermediate && sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging/history/done_intermediate

sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging

sudo -u hdfs hadoop fs -chmod -R 1777 / && sudo -u hdfs hadoop fs -chown -R hadoop:hadoop /

sudo -u hdfs hadoop fs -ls -R /

#Start YARN
sudo service hadoop-yarn-resourcemanager start
sudo service hadoop-yarn-nodemanager start
sudo service hadoop-mapreduce-historyserver start

hadoop fs -mkdir /input
hadoop fs -ls
hadoop fs -ls /user/hadoop
sudo -u hdfs hadoop fs -chown hadoop:hadoop /input
hadoop fs -put /etc/hadoop/conf/*.xml /input
export HADOOP_MAPRED_HOME=/usr/lib/hadoop-mapreduce
hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar grep input output 'dfs[a-z.]+'
hadoop fs -ls
hadoop fs -ls /output
hadoop fs -cat /output/part-r-00000
hadoop fs -cat /output/part-r-00000 | less

#How to start the various Hadoop services
sudo service hadoop-hdfs-namenode start
sudo service hadoop-hdfs-datanode start
sudo service hadoop-hdfs-secondarynamenode start
sudo service hadoop-yarn-resourcemanager start && sudo service hadoop-yarn-nodemanager start && sudo service hadoop-mapreduce-historyserver start

################################################################################################################
运行那条命令有时无法执行，直接删除目录/var/share/cmf即可。
http://localhost:7180/cmf/services/status
sudo service cloudera-scm-server restart



#Installing CDH4
zm@zengming-rj:~$ lsb_release -c
Codename:	precise
                   
#Create a new file /etc/apt/sources.list.d/cloudera
#Create a new file /etc/apt/sources.list.d/cloudera-cdh4.list 
deb [arch=amd64] http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib
deb-src http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh precise-cdh4 contrib

#Step 1a: Optionally Add a Repository Key
curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
#Step 2: Install CDH4 with MRv1
sudo apt-get update; sudo apt-get install hadoop-0.20-mapreduce-jobtracker

sudo apt-get update; sudo apt-get install hadoop-hdfs-namenode

sudo apt-get update; sudo apt-get install hadoop-hdfs-secondarynamenode

sudo apt-get update; sudo apt-get install hadoop-0.20-mapreduce-tasktracker hadoop-hdfs-datanode

sudo apt-get update; sudo apt-get install hadoop-client

#Step 3: Install CDH4 with YARN
sudo apt-get update; sudo apt-get install hadoop-yarn-resourcemanager

sudo apt-get update; sudo apt-get install hadoop-hdfs-namenode

sudo apt-get update; sudo apt-get install hadoop-hdfs-secondarynamenode

sudo apt-get update; sudo apt-get install hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce

sudo apt-get update; sudo apt-get install hadoop-mapreduce-historyserver hadoop-yarn-proxyserver

sudo apt-get update; sudo apt-get install hadoop-client



su - hadoop
sudo apt-get remove --purge hadoop* && sudo apt-get autoremove -f && sudo apt-get clean && sudo apt-get autoclean
cd /var/log
sudo rm -rf hadoop*
sudo mkdir hadoop-hdfs && sudo mkdir hadoop-mapreduce && sudo mkdir hadoop-yarn
sudo chmod -R 777 hadoop* && sudo chown hadoop:hadoop hadoop*

sudo apt-get update
sudo apt-get install curl
echo $JAVA_HOME
sudo env | grep JAVA_HOME
cd /home/zm/work/cloudera
wget http://archive.cloudera.com/cdh4/one-click-install/precise/amd64/cdh4-repository_1.0_all.deb
sudo dpkg -i cdh4-repository_1.0_all.deb
curl -s http://archive.cloudera.com/cdh4/ubuntu/precise/amd64/cdh/archive.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install hadoop-conf-pseudo
dpkg -L hadoop-conf-pseudo
sudo -u hdfs hdfs namenode -format
cd
mkdir bin
cd bin
sudo gedit hadoop-hdfs-start
	#!/bin/bash
	for service in /etc/init.d/hadoop-hdfs-*
	do
	sudo $service start
	done
sudo chmod +x hadoop-hdfs-start
./hadoop-hdfs-start
http://localhost:50070/dfshealth.jsp 


sudo apt-get update
#Resource Manager
sudo apt-get install hadoop-yarn-resourcemanager
#NameNode
sudo apt-get install hadoop-hdfs-namenode
#Secondary NameNode
#sudo apt-get install hadoop-hdfs-secondarynamenode
#All cluster hosts except the Resource Manager
sudo apt-get install hadoop-yarn-nodemanager hadoop-hdfs-datanode hadoop-mapreduce
#One host
sudo apt-get install hadoop-mapreduce-historyserver hadoop-yarn-proxyserver
#Client
sudo apt-get install hadoop-client
sudo vi /etc/hostname

sudo adduser hadoop 
sudo usermod -G sudo hadoop 

cd /home/hadoop/.ssh && chmod 644 authorized_keys
sudo chmod -R 777 /home/hadoop/.ssh #所有机器
ssh-keygen -t rsa
ssh-keygen -t dsa -P '' -f ~/.ssh/id_dsa
cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

cd /etc/ssh
sudo chown hadoop:hadoop *

ssh-copy-id -i /home/hadoop/.ssh/id_rsa.pub hadoop@hadoop-01:/home/hadoop/.ssh/
ssh-copy-id -i $HOME/.ssh/id_rsa.pub hadoop@inm2  

http://www.blogjava.net/himalayas/archive/2011/11/24/364723.html



sudo addgroup hadoop
sudo adduser -ingroup hadoop hadoop

