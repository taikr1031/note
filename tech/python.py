RRR∑√／∝∞∮∫／÷×－＋	±∧∨∏∪∪∩∈∵∵∴∴√∽≌⊙⌒∠∥⊥
##数学公式：
阶乘: n!=1×2×3×...×n


>>> import os
>>> print(os.getcwd()) #查看当前路径
>>> os.chdir("d:\idea15") #改变当前路径

>>> emailText = open('email/ham/6.txt').read()
>>> print(emailText)

python语言中所有的变量默认都是全局有效的。

###秩(rank);维度(dimensions);轴(axes)
[1, 2, 3, 4]:秩(rank)=轴数(ndim)=数组层数n=1;维度(dimensions)=1;轴(axes)=1;轴长=4
[[ 1., 0., 0.], [ 0., 1., 2.]]:秩(rank)=轴数(ndim)=2;维度(dimensions)=2;轴(axes)=2;轴长=3;shape=(2,3)
>>> from numpy import *
>>> a = arange(15).reshape(3, 5)
>>> a
    array([[ 0,  1,  2,  3,  4], [ 5,  6,  7,  8,  9], [10, 11, 12, 13, 14]])
#秩(rank)=轴数(ndim)=2;维度(dimensions)=3;轴(axes)=2;轴长=3;shape=(3,5)
       
###matplotlib安装
python -m pip install --upgrade pip
pip install matplotlib-2.0.0b4-cp34-cp34m-win32.whl
pip install six-1.10.0-py2.py3-none-any.whl
cd python-dateutil-2.5.3
python setup.py install
安装pyparsing.exe
#feedparser安装
pip install feedparser



FQ:
1.'dict' object has no attribute 'iteritems'  
  freqDict.iteritems() -> freqDict.items()
2.'range' object doesn't support item deletion
  del (trainingSet[randIndex]) -> del (list(trainingSet)[randIndex])