C:\Program Files (x86)\PowerCmd>python -V
Python 3.4.3

>>> print("Hello, World!");

E:\>python E:\test.py
Hello, World


'''Mysql命令'''
	CREATE DATABASE webdiskdb DEFAULT CHARSET=utf8;
	USE webdiskdb;
	SHOW TABLES;
	SHOW COLUMNS FROM LOGIN_USER;


'''DJango 后台'''
http://localhost:8000/admin
root
root
taikongren1031@163.com

'''常用命令'''
pip install tornado
#在项目文件夹路径下，运行manage.py：
python manage.py check	#检查数据库
python manage.py syncdb	#同步数据库
python manage.py runserver 0.0.0.0:8080	#现在只有本机可以访问，要让外网能够访问，或是要更换默认的8000端口

#增加一个模块步骤
python manage.py startapp app	#创建子模块，注意要删掉 migrations 文件夹，否则无法使用ORM
[site]settings.py 的 INSTALLED_APPS 中增加 'app',
[site]urls.py 的 urlpatterns 中增加 url('^users/', include('users.urls')),
在子模块根目录中增加 urls.py 文件，并配置子模块的 URL
在子模块根目录中增加 templates/子模块名 文件夹，用于存放子模块的HTML模板文件

#爬虫
pip install Scrapy

import pymysql
conn = pymysql.connect(host='localhost', port=3306,user='root',passwd='root',db='DeliveryAddress',charset='UTF8')
cur = conn.cursor()
cur.execute("INSERT INTO `ProvinceCityCountyTown` VALUES ('3', '0', '上海')")
conn.commit()#这里是用conn提交的,很让人不解，为什么不用cur提交呢？害得我baidu都没找到例子，
cur.close()
conn.close()


#文本文件的输入输出
>>> f=open("d:/record.txt", "r")
>>> print(f.closed)		#查询文件是否关闭
False

#range()
>>> S = 'abcdefghijk'
>>> for i in range(0,len(S),2):print(S[i])
...
a
c
e
g
i
k
>>>

#enumerate()


#表推导：表推导(list comprehension)是快速生成表的方法
>>> L = [x**2 for x in range(10)]				# 2次方
>>> print(L)
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> LL = [x**3 for x in range(10)]				# 3次方
>>> print(LL)
[0, 1, 8, 27, 64, 125, 216, 343, 512, 729]
>>>
>>> xl = [1,3,5]
>>> yl = [9,12,13]
>>> L  = [ x**2 for (x,y) in zip(xl,yl) if y > 10]
>>> print(L)
[9, 25]

#lambda函数：生成一个函数对象。该函数参数为x,y，返回值为x+y。函数对象赋给func。func的调用与正常函数无异。
>>> func = lambda x,y: x + y
>>> print(func(3,4))
7

#map()有两个参数，一个是lambda所定义的函数对象，一个是包含有多个元素的表。map()的功能是将函数对象依次作用于表的每一个元素，每次作用的结果储存于返回的表re中。map通过读入的函数(这里是lambda函数)来操作数据（这里“数据”是表中的每一个元素，“操作”是对每个数据加3）。
>>> re = map((lambda x: x+3),[1,3,5,6])
>>> print(re)
<map object at 0x01EAA2D0>
>>> print(list(re))
[4, 6, 8, 9]
>>>
>>> re = map((lambda x,y: x+y),[1,2,3],[6,7,9])
>>> print(list(re))
[7, 9, 12]
>>>

#filter()函数
filter函数的第一个参数也是一个函数对象。它也是将作为参数的函数对象作用于多个元素。如果函数对象返回的是True，则该次的元素被储存于返回的表中。filter通过读入的函数来筛选数据。同样，在Python 3.X中，filter返回的不是表，而是循环对象。

#reduce()
print(reduce((lambda x,y: x+y),[1,2,5,7,9]))

#动态类型
#不可变数据类型
>>> L1 = [1,2,3]
>>> L2=L1
>>> L1=1
>>> print(L1)
1
>>> print(L2)
[1, 2, 3]
#可变数据对象
>>> L1 = [1,2,3]
>>> L2 = L1
>>> L1[0] = 10
>>> print(L2)
[10, 2, 3]
>>> print(L1)
[10, 2, 3]

'''Python深入 '''
###Python深入01 特殊方法与多范式
可以通过dir()来查看对象所拥有的特殊方法，比如dir(1)

###Python深入02 上下文管理器
上下文管理器(context manager)是Python2.5开始支持的一种语法，用于规定某个对象的使用范围。一旦进入或者离开该使用范围，会有特殊操作被调用 (比如为对象分配或者释放内存)。它的语法形式是with...as...

###Python深入03 对象的属性
对象的属性可能来自于其类定义，叫做类属性(class attribute)。类属性可能来自类定义自身，也可能根据类定义继承来的。一个对象的属性还可能是该对象实例定义的，叫做对象属性(object attribute)。
对象的属性储存在对象的__dict__属性中。__dict__为一个词典，键为属性名，对应的值为属性本身。

#特性
特性使用内置函数property()来创建。property()最多可以加载四个参数。前三个参数为函数，分别用于处理查询特性、修改特性、删除特性。最后一个参数为特性的文档，可以为一个字符串，起说明作用。

###Python深入04 闭包
一个函数和它的环境变量合在一起，就构成了一个闭包(closure)。在Python                  中，所谓的闭包是一个包含有环境变量取值的函数对象。环境变量取值被保存在函数对象的__closure__属性中。

##### Python深入06 内存管理
为了探索对象在内存的存储，我们可以求助于Python的内置函数id()。它用于返回对象的身份(identity).其实，这里所谓的身份，就是该对象的内存地址。
在Python中，整数和短小的字符，Python都会缓存这些对象，以便重复使用。当我们创建多个等于1的引用时，实际上是让所有这些引用指向同一个对象。
为了检验两个引用指向同一个对象，我们可以用is关键字。is用于判断两个引用所指的对象是否相同。
在Python中，每个对象都有存有指向该对象的引用总数，即引用计数(reference count)。我们可以使用sys包中的getrefcount()，来查看某个对象的引用计数。需要注意的是，当使用某个引用作为参数，传递给getrefcount()时，参数实际上创建了一个临时的引用。因此，getrefcount()所得到的结果，会比期望的多1。
#对象引用对象
对象引用对象，是Python最基本的构成方式。即使是a = 1这一赋值方式，实际上是让词典的一个键值"a"的元素引用整数对象1。该词典对象用于记录所有的全局引用。该词典引用了整数对象1。我们可以通过内置函数globals()来查看该词典。
#引用减少
某个对象的引用计数可能减少。比如，可以使用del关键字删除某个引用，del也可以用于删除容器元素中的元素
#垃圾回收
从基本原理上，当Python的某个对象的引用计数降为0时，说明没有任何引用指向该对象，该对象就成为要被回收的垃圾了
垃圾回收时，Python不能进行其它的任务。频繁的垃圾回收将大大降低Python的工作效率。如果内存中的对象不多，就没有必要总启动垃圾回收。
Python只会在特定条件下，自动启动垃圾回收。当Python运行时，会记录其中分配对象(object allocation)和取消分配对象(object deallocation)的次数。当两者的差值高于某个阈值时，垃圾回收才会启动。可以通过gc模块的get_threshold()方法，查看该阈值:print(gc.get_threshold())
#分代回收
Python同时采用了分代(generation)回收的策略。这一策略的基本假设是，存活时间越久的对象，越不可能在后面的程序中变成垃圾。
Python将所有的对象分为0，1，2三代。所有的新建对象都是0代对象。当某一代对象经历过垃圾回收，依然存活，那么它就被归入下一代对象
#孤立的引用环
引用环的存在会给上面的垃圾回收机制带来很大的困难。这些引用环可能构成无法使用，但引用计数不为0的一些对象。

'''Python补充'''
###Python补充01 序列的方法
序列包含有定值表(tuple)和表(list)。此外，字符串(string)是一种特殊的定值表。表的元素可以更改，定值表一旦建立，其元素不可更改。

###Python补充02 Python小技巧
import模块。在Python经常使用import声明，以使用其他模块(也就是其它.py文件)中定义的对象。
#import模块
1) 使用__name__
2) 更多import使用方式
	import TestLib as test         # 引用TestLib模块，并将它改名为t
	from TestLib import lib_func   # 只引用TestLib中的lib_func对象，并跳过TestLib引用字段
	from TestLib import *          # 引用所有TestLib中的对象，并跳过TestLib引用字段

#查询
1) 查询函数的参数。当我们想要知道某个函数会接收哪些参数的时候，可以使用下面方法查询。
import inspect
print(inspect.getargspec(func))
2) 查询对象的属性。除了使用dir()来查询对象的属性之外，我们可以使用下面内置(built-in)函数来确认一个对象是否具有某个属性：
a = [1,2,3]
print(hasattr(a,'append'))
3) 查询对象所属的类和类名称
a = [1, 2, 3]
print(a.__class__)				#<class 'list'>
print(a.__class__.__name__)		#list
3) 查询父类。cls.__base__
print(list.__base__)	#<class 'object'>
#使用中文(以及其它非ASCII编码)
在Python程序的第一行加入#coding=utf8，例如:
#coding=utf8
print("你好吗？")
也能用以下方式：
#-*- coding: UTF-8 -*-
print("你好吗？")
#表示2进制，8进制和16进制数字
print(0b1110)     # 二进制，以0b开头
print(0o10)       # 八进制，以0o开头
print(0x2A)       # 十六进制，以0x开头
#注释。注释应该和所在的程序块对齐。
一行内的注释可以以#开始
多行的注释可以以'''开始，以'''结束，比如
#搜索路径
查看搜索路径：
import sys
print(sys.path)
#脚本与命令行结合
可以使用下面方法运行一个Python脚本，在脚本运行结束后，直接进入Python命令行。这样做的好处是脚本的对象不会被清空，可以通过命令行直接调用
$python -i script.py
#安装非标准包
Python的标准库随着Python一起安装。当我们需要非标准包时，就要先安装。
1) 使用Linux repository (Linux环境)
这是安装Python附加包的一个好的起点。你可以在Linux repository中查找可能存在的Python包 (比如在Ubuntu Software Center中搜索matplot)。
2) 使用pip。pip是Python自带的包管理程序，它连接Python repository，并查找其中可能存在的包。
比如使用如下方法来安装、卸载或者升级web.py：
$pip install web.py
$pip uninstall web.py
$pip install --upgrade web.py
如果你的Python安装在一个非标准的路径(使用$which python来确认python可执行文件的路径)中，比如/home/vamei/util/python/bin中，你可以使用下面方法设置pip的安装包的路径:
$pip install --install-option="--prefix=/home/vamei/util/" web.py
3) 从源码编译
如果上面方法都没法找到你想要的库，你可能需要从源码开始编译。Google往往是最好的起点。

###Python补充03 Python内置函数清单
Python内置(built-in)函数随着python解释器的运行而创建。在Python的程序中，你可以随时调用这些函数，不需要定义。最常见的内置函数是:
print("Hello World!")
在Python教程中，我们已经提到下面一些内置函数:
基本数据类型 type()
反过头来看看 dir() help() len()
词典 len()
文本文件的输入输出 open()
循环设计 range() enumerate() zip()
循环对象 iter()
函数对象 map() filter() reduce()

下面我采取的都是实际的参数，你可以直接在命令行尝试效果。
数学运算
abs(-5)                          # 取绝对值，也就是5
round(2.6)                       # 四舍五入取整，也就是3.0
pow(2, 3)                        # 相当于2**3，如果是pow(2, 3, 5)，相当于2**3 % 5
cmp(2.3, 3.2)                    # 比较两个数的大小
divmod(9,2)                      # 返回除法结果和余数
max([1,5,2,9])                   # 求最大值
min([9,2,-4,2])                  # 求最小值
sum([2,-1,9,12])                 # 求和

类型转换
int("5")                         # 转换为整数 integer
float(2)                         # 转换为浮点数 float
long("23")                       # 转换为长整数 long integer
str(2.3)                         # 转换为字符串 string
complex(3, 9)                    # 返回复数 3 + 9i
ord("A")                         # "A"字符对应的数值
chr(65)                          # 数值65对应的字符
unichr(65)                       # 数值65对应的unicode字符
bool(0)                          # 转换为相应的真假值，在Python中，0相当于False
在Python中，下列对象都相当于False： [], (), {}, 0, None, 0.0, ''
bin(56)                          # 返回一个字符串，表示56的二进制数
hex(56)                          # 返回一个字符串，表示56的十六进制数
oct(56)                          # 返回一个字符串，表示56的八进制数

list((1,2,3))                    # 转换为表 list
tuple([2,3,4])                   # 转换为定值表 tuple
slice(5,2,-1)                    # 构建下标对象 slice
dict(a=1,b="hello",c=[1,2,3])    # 构建词典 dictionary

序列操作
all([True, 1, "hello!"])         # 是否所有的元素都相当于True值
any(["", 0, False, [], None])    # 是否有任意一个元素相当于True值

sorted([1,5,3])                  # 返回正序的序列，也就是[1,3,5]
reversed([1,5,3])                # 返回反序的序列，也就是[3,5,1]

类，对象，属性
class Me(object):
    def test(self):
        print "Hello!"
def new_test():
    print "New Hello!"
me = Me()

hasattr(me, "test")               # 检查me对象是否有test属性
getattr(me, "test")               # 返回test属性
setattr(me, "test", new_test)     # 将test属性设置为new_test
delattr(me, "test")               # 删除test属性
isinstance(me, Me)                # me对象是否为Me类生成的对象 (一个instance)
issubclass(Me, object)            # Me类是否为object类的子类
 
编译，执行
repr(me)                          # 返回对象的字符串表达
compile("print('Hello')",'test.py','exec')       # 编译字符串成为code对象
eval("1 + 1")                     # 解释字符串表达式。参数也可以是compile()返回的code对象
exec("print('Hello')")            # 解释并执行字符串，print('Hello')。参数也可以是compile()返回的code对象

其他
input("Please input:")            # 等待输入
globals()                         # 返回全局命名空间，比如全局变量名，全局函数名
locals()                          # 返回局部命名空间

###Python补充05 字符串格式化 (%操作符)
#模板
格式化字符串时，Python使用一个字符串作为模板。模板中有格式符，这些格式符为真实值预留位置，并说明真实数值应该呈现的格式。Python用一个tuple将多个值传递给模板，每个值对应一个格式符。
print("I'm %s. I'm %d year old" % ('Vamei', 99))							#I'm Vamei. I'm 99 year old
print("I'm %(name)s. I'm %(age)d year old" % {'name':'Vamei', 'age':99})	#I'm Vamei. I'm 99 year old
#格式符
格式符为真实值预留位置，并控制显示的格式。格式符可以包含有一个类型码，用以控制显示的类型，如下:
%s    字符串 (采用str()的显示)
%r    字符串 (采用repr()的显示)
%c    单个字符
%b    二进制整数
%d    十进制整数
%i    十进制整数
%o    八进制整数
%x    十六进制整数
%e    指数 (基底写为e)
%E    指数 (基底写为E)
%f    浮点数
%F    浮点数，与上相同
%g    指数(e)或浮点数 (根据显示长度)
%G    指数(E)或浮点数 (根据显示长度)
%%    字符"%"
可以用如下的方式，对格式进行进一步的控制：
%[(name)][flags][width].[precision]typecode
(name)为命名
flags可以有+,-,' '或0。+表示右对齐。-表示左对齐。' '为一个空格，表示在正数的左侧填充一个空格，从而与负数对齐。0表示使用0填充。
width表示显示宽度
precision表示小数点后精度

比如：
print("%+10x" % 10)
print("%04d" % 5)
print("%6.3f" % 2.3)

上面的width, precision为两个整数。我们可以利用*，来动态代入这两个量。比如：
print("%.*f" % (4, 1.2))
Python实际上用4来替换*。所以实际的模板为"%.4f"

'''Python标准库'''

'''被解放的姜戈'''
创建django工程：D:\Python34\Lib\site-packages\django\bin\django-admin.py startproject webdisk
判断django是否安装：
import django
print(django.VERSION)
启动django工程：进入工程目录，在命令行运行 python manage.py runserver 0.0.0.0:8000。访问http://127.0.0.1:8000/即可

###被解放的姜戈01 初试天涯


'''Python常见问题QA'''
#ImportError: No module named 'MySQLdb'
python2.x中用习惯了mysqldb，但是在python3.x取而代之的是：pymysql
D:\Python34>pip install pymysql
替换下方文件
D:\Python34\Lib\site-packages\django\db\backends\mysql\base.py

#ImportError: No module named 'MySQLdb'
在[site][site]文件夹的跟目录的 __init__.py 中，增加：
import pymysql
pymysql.install_as_MySQLdb()

#Undefined variable from import
Eclipse 设置：
Window -> Preferences -> PyDev -> Editor -> Code Analysis -> Undefined -> Undefined Variable From Import -> Ignore
Window -> Preferences -> PyDev -> Editor -> Code Analysis -> Imports -> Import not found -> Ignore

#(unicode error) 'utf-8' codec can't decode
只用notepad++打开test.py >> 菜单栏Encoding（编码）>> Convert to UTF-8（转化成utf-8）

#文件路径
save_path = 'D://temp.out'