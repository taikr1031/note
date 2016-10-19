ionic start chat-app tabs #创建工程
ionic serve --address 10.68.19.114 #启动工程


ionic start myApp tabs #创建工程
cd myApp
ionic platform add android
ionic build android
ionic serve #启动工程-网页
ionic emulate android #启动工程-模拟器
ionic run android -l -c -s #启动工程-真机

#解决 Access-Control-Allow-Origin 问题
在chrome应用商店搜一下“Allow-Control-Allow-Origin: ”就ok了


$cordovaCamera		cordova plugin add cordova-plugin-camera
$cordovaImagePicker	cordova plugin add https://github.com/wymsee/cordova-imagePicker.git
$cordovaMedia		cordova plugin add cordova-plugin-media
cordova plugin add https://github.com/EddyVerbruggen/Toast-PhoneGap-Plugin.git

这个不能装：cordova plugin add https://github.com/Telerik-Verified-Plugins/NativePageTransitions.git

0     712388   debug    [native transition] enabling plugin
1     712392   debug    [native transition] disabling ionic transitions
2     726264   debug    [native transition] $stateChangeStart, [object Object],



#### GENYMOTION ##########################################################
https://www.genymotion.com/account/login/
taikongren
781031
taikongren1031@163.com

QA:
1、adb.exe Command failed with exit code 1 Error output:error: cannot parse version string: kg01
在cmd中先使用命令adb kill-server来关闭adb服务
接着再使用命令adb start-server来重启adb服务
接着使用adb devices来查看adb是否启动成功，如果出现
error: cannot parse version string: kg01
则说明启动失败，再次重启
如果显示的是List of devices attached
则说明启动成功了

2、No Content-Security-Policy meta tag found. Please add one when using the cordova-plugin-whitelist plugin:
在www目录下的index.html中增加以下语句（放在所有<meta>最前面）：
<meta http-equiv="Content-Security-Policy" content="default-src *; style-src 'self' 'unsafe-inline'; script-src: 'self' 'unsafe-inline' 'unsafe-eval'>

3、genymotion无法启动
点击运行并重新安装vbox，安装文件路径 /home/taikongren/tool/genymotion/virtualbox-5.0_5.0.16-105871-Ubuntu-trusty_amd64.deb
重新安装完成后即可运行genymotion
#### GENYMOTION ##########################################################