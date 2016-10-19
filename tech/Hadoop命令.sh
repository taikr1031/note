% hadoop fsck / -files -blocks

% hadoop fs -copyFromLocal input/docs/quangle.txt hdfs://localhost/user/tom/quangle.txt

% hadoop fs -copyFromLocal input/docs/quangle.txt /user/tom/quangle.txt

% hadoop fs -copyFromLocal input/docs/quangle.txt quangle.txt

% hadoop fs -copyToLocal quangle.txt quangle.copy.txt
% md5 input/docs/quangle.txt quangle.copy.txt

% hadoop fs -mkdir books
% hadoop fs -ls .

% hadoop fs -ls file:///

#distcp 并行复制
% hadoop distcp file1 file2

#单独启动 DataNode
$HADOOP_HOME/sbin/hadoop-daemon.sh start DataNode
$HADOOP_HOME/sbin/hadoop-daemon.sh start jobtracker