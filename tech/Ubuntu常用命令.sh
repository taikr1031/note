sudo gedit /etc/environment
update-alternatives --config java //有时候不知道java安装在哪里了 通过whereis java命令不能知道java真是的安装路径 

是语言不对 ，安装前先执行：export LANG=en_US
create db mydb using db2admin utf-8 territory CN  
db2 "CREATE DATABASE mydb USING CODESET ISO8859-1(UTF-8) TERRITORY CN"
create db mydb using codeset utf-8 territory CN  

(1)Ubuntu常用命令
sudo cp -r /etc/apt/sources.list /etc/apt/sources.list.backup #备份源
sudo gedit /etc/apt/sources.list #添加源
sudo apt-get update #启用新的更新源   
sudo apt-get update && sudo apt-get dist-upgrade #更新系统
sudo chmod -R 777 *** #修改文件/文件夹权限
sudo chown zm:zm *** #修改文件/文件夹所属用户和用户组
df -hl #查看各磁盘分区使用情况
cat /etc/passwd #查看所有用户信息
sudo find /home/zm -name gc.log #文件查找
du -ach --max-depth=1 #查看当前目录及子目录的大小
sudo lsof -i :2181 #某个端口的信息
sudo ps -ef | grep java #根据名称查看进程信息
sudo kill -9 PID #根据进程PID杀死进程
sudo mv data1 data2 #文件重命名
sudo cp -a /home/zm/work/hadoop /home/zm/work/hadoop_bak #复制目录
sudo rm -rf /dir1 #删除文件夹
sudo shutdown -r now #Ubuntu重启
shutdown -Fr #Aix重启
sudo  ufw enable|disable #开启/关闭防火墙
sudo ufw status #检查防火墙的状态
sudo cat /etc/shadow #输入"cat /etc/shadow"回车，最后一行的第一个单词即“：”以前的部分应该就是用户名
sudo passwd root #修改root密码
sudo gedit /etc/hostname #修改主机名
sudo usermod old -l new #修改主用户名
hostname #查看主机名
hostname -i #查看IP
netstat -apn | grep 8080
sudo update-alternatives --install /usr/bin/jps jps /usr/lib/jvm/jdk1.7.0_21/bin/jps 1   #处理 jps 命令问题
sudo /etc/init.d/networking restart //修改hosts文件后重启网络
sudo rm -rf /etc/udev/rules.d/70-persistent-net.rules #解决virtualbox复制ubuntu后改变mac地址不能识别网卡问题
sudo apt-get install openssh-server openssh-client #安装SSH，安装完以后用 netstat -tlp看一下
sudo apt-get -y purge libreoffice* #彻底删除LibreOffice
unzip -O GBK xxx.zip

#修改配置文件
sudo gedit /etc/hosts

#下载
aria2c -c -s 5 http://www.mirror.tw/pub/ubuntu/releases/jaunty/ubuntu-9.04-desktop-i386.iso
aria2c -o gutsy.torrent http://cdimage.ubuntu.com/daily-live/current/gutsy-desktop-i386.iso.torrent
#ibus隐藏的设置,可以通过终端调出来,输入指令,然后会弹出一个ibus设置的框,里面有一个键盘的选项,你可以设置翻页的快捷键
sudo /usr/lib/ibus-sunpinyin/ibus-setup-sunpinyin

vmware虚拟机网卡断开：
删除配置规则缓存文件，重启后会根据现在的网络配置重新生成，然后重启
# rm -rf etc/udev/rules.d/70-persistent-net.rules
# reboot
重启后会发现网卡正常启动

sudo /etc/init.d/vboxdrv setup  #VirtualBox无法启动执行

sudo dpkg --info "软件包名" #列出软件包解包后的包名称.
sudo dpkg -l #列出当前系统中所有的包.可以和参数less一起使用在分屏查看. (类似于rpm -qa)
sudo dpkg -l |grep -i "软件包名" #查看系统中与"软件包名"相关联的包.
sudo dpkg -s #查询已安装的包的详细信息
sudo dpkg -L #查询系统中已安装的软件包所安装的位置. (类似于rpm -ql)
sudo dpkg -S #查询系统中某个文件属于哪个软件包. (类似于rpm -qf)
sudo dpkg -I #查询deb包的详细信息,在一个软件包下载到本地之后看看用不用安装(看一下呗).
sudo dpkg -i #手动安装软件包(这个命令并不能解决软件包之前的依赖性问题),如果在安装某一个软件包的时候遇到了软件依赖的问题,可以用apt-get -f install在解决信赖性这个问题.
sudo dpkg -r #卸载软件包.不是完全的卸载,它的配置文件还存在.
sudo dpkg -P #全部卸载(但是还是不能解决软件包的依赖性的问题)
sudo dpkg -reconfigure #重新配置

sudo apt-cache search package #搜索包
sudo apt-cache show package #获取包的相关信息，如说明、大小、版本等
sudo apt-get install package #安装包
sudo apt-get install package -- reinstall #重新安装包
sudo apt-get -f install 修复安装"-f = ——fix-missing"
sudo apt-get remove package #删除包
sudo apt-get remove --purge package  #删除包，包括删除配置文件等
sudo apt-get update #更新源
sudo apt-get upgrade #更新已安装的包
sudo apt-get dist-upgrade #升级系统
sudo apt-get dselect-upgrade #使用 dselect 升级
sudo apt-cache depends package #了解使用依赖
sudo apt-cache rdepends package #是查看该包被哪些包依赖
sudo apt-get build-dep package #安装相关的编译环境
sudo apt-get source package #下载该包的源代码
sudo apt-get clean && sudo apt-get autoclean #清理无用的包
sudo apt-get check #检查是否有损坏的依赖

update-alternatives --config java //有时候不知道java安装在哪里了 通过whereis java命令不能知道java真是的安装路径 

#查看机器硬件CPU是否支持虚拟化，命令行输入，有输出就证明支持。重启进BIOS，找到virtualization的一项，改为Enable，重启进入系统。配置虚拟机，启用“VT-x/AMD-V”
egrep ‘^flags.*(vmx|svm)’ /proc/cpuinfo
mount -t vboxsf share-s /home/hadoop/share #挂载共享文件夹

##Windows查看端口占用情况
C:\>netstat -ano #1.查看所有的端口占用情况
C:\>netstat -aon|findstr "9050" #2.查看指定端口的占用情况
C:\>tasklist|findstr "2016"  #3.查看PID对应的进程
C:\>taskkill /f /t /im tor.exe #4.结束该进程

export PATH=$PATH:$HADOOP_HOME/bin #设置环境变量
$source ~/.profile #使环境变量修改生效

sudo apt-get install tcl tk expect #用expect 实现切换用户时自动输入密码

/*********** autologin.sh ***********/
#!/usr/bin/expect
set timeout 3
spawn su - hadoop
expect "Password:"
exec sleep 1
send "zm\r"
interact
/*********** autologin.sh ***********/

sudo apt-get install tcl tk expect


#System Load Indicator ( 系统状态指示器）
sudo add-apt-repository ppa:indicator-multiload/stable-daily
sudo apt-get update
sudo apt-get install indicator-multiload


/****************************************DB2安装配置 begin************************************************/
taikongren@taikongren-pc:/opt/ibm/db2/V10.1_01/das/bin$ sudo /opt/ibm/db2/V10.1_01/das/bin/db2admin start
SQL4409W  The DB2 Administration Server is already active.

taikongren@taikongren-pc:/opt/ibm/db2/V10.1_01/das/bin$ su - dasusr1  
密码：1
dasusr1@taikongren-pc:~$ 

db2inst1@taikongren-pc:~$ db2 get instance
The current database manager instance is:  db2inst1

db2inst1@taikongren-pc:~$ db2 create db mydb using codeset utf-8 territory CN  
DB20000I  The CREATE DATABASE command completed successfully.
db2inst1@taikongren-pc:~$ db2 list db directory
/****************************************DB2安装配置 end************************************************/


/****************************************UBUNTU安装配置************************************************/
--Ubuntu介绍
http://wiki.ubuntu.org.cn/index.php?title=ubuntu%E6%A1%8C%E9%9D%A2%E5%85%A5%E9%97%A8%E6%8C%87%E5%8D%97&variant=zh-cn

--安装JDK
http://iliuyong.iteye.com/blog/228762

--安装Eclipse
http://crabdave.iteye.com/blog/639874
--Ubuntu Eclipse 中文乱码
http://hi.baidu.com/dingxirong/blog/item/f2e6b937fd5add2b5ab5f5c6.html

--安装Tomcat
http://www.linuxidc.com/Linux/2010-07/27293.htm

--安转DB2
http://dyccsxg.iteye.com/blog/997976
http://www.blogjava.net/hardson/archive/2008/05/13/200115.html
https://www14.software.ibm.com/webapp/iwm/web/reg/download.do?source=swg-db2expressc&S_TACT=109HF15W&lang=en_US&S_PKG=dllinux64&cp=UTF-8&dlmethod=http

--常用软件
http://blog.csdn.net/uraplutonium/article/details/6181522

--Wine
http://forum.ubuntu.org.cn/viewtopic.php?t=107816

--Thinkpad Trackpoint
http://www.fovweb.com/fov/ubuntu-thinkpad.html

--thinkpad 驱动
https://wiki.ubuntu.com/ThinkFinger

--各种压缩和解压命令
http://www.diybl.com/course/6_system/linux/ubuntu/20110902/559481.html

--删除ubuntu冗余的开机启动菜单
http://blog.chinaunix.net/uid-24807808-id-3070248.html

--WebQQ:
http://linuxtoy.org/archives/webqq-desktop-integration.html
Wine:
http://www.linuxdiyf.com/viewarticle.php?id=181292

#java环境变量设置
sudo gedit /etc/profile
export ANDROID_HOME=/home/taikongren/work/adt-bundle-linux-x86_64-20140321/sdk
export JAVA_HOME=/usr/lib/jvm/java-6-oracle
export CLASSPATH=.:$JAVA_HOME/lib:$JAVA_HOME/jre/lib
export PATH=$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH
export M2_HOME=/home/taikongren/tool/apache-maven-3.2.5
export PATH=$M2_HOME/bin:$PATH
sudo source /etc/profile
    
#安装notepadqq
sudo add-apt-repository ppa:notepadqq-team/notepadqq
sudo apt-get update
sudo apt-get install notepadqq 
卸载命令：sudo apt-get remove notepadqq

#安装flash player
首先下载flash player，下载地址：
http://get.adobe.com/cn/flashplayer/
选择.tar.gz格式。
下载之后打开终端，cd到下载文件的目录，解压install_flash_player_11_linux.x86_64.tar.gz文件：
tar -zxvf install_flash_player_11_linux.x86_64.tar.gz
然后安装flash player
sudo  cp libflashplayer.so /usr/lib/mozilla/plugins/
sudo cp -r ./usr/* /usr/
将libflashplayer.so拷贝到Firefox的Plugin目录，将usr目录下的所有文档拷贝到系统的/usr目录！
然后重启Firefox！

#Android SDK Manager国内无法更新的解决方案  http://www.linuxidc.com/Linux/2015-01/111958.htm
sudo gedit /etc/hosts/
在文件最后添加以下信息：    
203.208.46.146 dl.google.com
203.208.46.146 dl-ssl.google.com
1.启动 Android SDK Manager ，打开主界面，依次选择「Tools」、「Options...」，弹出『Android SDK Manager - Settings』窗口；
2.在『Android SDK Manager - Settings』窗口中，在「HTTP Proxy Server」和「HTTP Proxy Port」输入框内填入mirrors.neusoft.edu.cn和80，并且选　　　中「Force https://... sources to be fetched using http://...」复选框。设置完成后单击「Close」按钮关闭『Android SDK Manager - Settings』　　　窗口返回到主界面；
3.依次选择「Packages」、「Reload」。

