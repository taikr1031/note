from numpy import * #科学计算包
import operator #运算符模块

def classify0(inX, dataSet, labels, k):
  dataSetSize = dataSet.shape{0}; #矩阵第一维度的长度
  diffMat = tile(inX, (dataSetSize, 1)) - dataSet #tile函数将inX=[0,0]第一个维度重复1遍，第二个维度重复dataSetSize遍，然后与dataSet矩阵相减
  sqDiffMat = diffMat**2 #矩阵按元素逐个平方
  sqDistances = sqDiffMat.sum(axis=1) #矩阵的每一行向量相加
  distances = sqDistances**0.5 #矩阵按元素逐个开方
  sortedDistIndicies = distances.argsort() #矩阵值从小到大的索引值
  classCount = {}
  for i in range(k): #选择距离最小的k个点
    voteIlabel = labels[sortedDistIndicies[i]
    classCount[voteIlabel]= classCount.get(voteIlabel, 0) + 1
    sortedCount = sorted(classCount.iteritems),key = operator.itemgetter(1), reverse = True)
    return sortedClassCount[0][0]
    

def createDataSet():
	group = array([[1,0,1,1],[1,0,1,0],[0,0],[0,0,1]])
	labels = ['A','A','B','B']
	return group, labels
  