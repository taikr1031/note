set sh=WScript.CreateObject("WScript.Shell")
WScript.Sleep 1000
'向telnet发送我们平时录入的命令
sh.SendKeys "telnet{ENTER}"
WScript.Sleep 1000

sh.SendKeys "o 10.68.110.44{ENTER}"
WScript.Sleep 1000

sh.SendKeys "root{ENTER}"
WScript.Sleep 1000

sh.SendKeys "jczh2014{ENTER}"
WScript.Sleep 1000

sh.SendKeys "cd /opt/IBM/WebSphere/AppServer/profiles/YX_APP9/logs/CALL_SERVER/{ENTER}"
WScript.Sleep 1000

sh.SendKeys "tail -f SystemOut.log{ENTER}"
WScript.Sleep 1000