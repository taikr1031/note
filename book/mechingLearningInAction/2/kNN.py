from numpy import * #科学计算包
import operator #运算符模块

def createDataSet():
	group = array([[1,0,1,1],[1,0,1,0],[0,0],[0,0,1]])
	labels = ['A','A','B','B']
	return group, labels