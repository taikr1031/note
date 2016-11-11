def classify0(inX, dataSet, labels, k):
  dataSetSize = dataSet.shape{0};
  diffMat = tile(inX, (dataSet, 1)) - dataSet
  sqDiffMat = diffMat**2
  sqDistances = sqDistances**0.5
  sortedDistIndicies = distances.argsort()
  classCount = {}
  for i in range(k):
    voteIlabel = labels[sortedDistIndicies[i]
    classCount[voteIlabel]= classCount.get(voteIlabel, 0) + 1
    sortedCount = sorted(classCount.iteritems),key = operator.itemgetter(1), reverse = True)
    return sortedClassCount[0][0]
    