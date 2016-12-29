#安装配置
创建数据目录
MongoDB将数据目录存储在 db 目录下。但是这个数据目录不会主动创建，我们在安装完成后需要创建它。请注意，数据目录应该放在根目录下（(如： C:\ 或者 D:\ 等 )。
在本教程中，我们已经在C：盘 安装了 mongodb，现在让我们创建一个data的目录然后在data目录里创建db目录。C:\data\db
C:\Program Files\MongoDB\Server\3.2\bin>mongod.exe --dbpath C:\data\db

#将MongoDB服务器作为Windows服务运行
mongod.exe --bind_ip yourIPadress --logpath "C:\data\dbConf\mongodb.log" --logappend --dbpath "C:\data\db" --port yourPortNumber --serviceName "YourServiceName" --serviceDisplayName "YourServiceName" --install

#创建的数据库mydb 列表中是不存在的。要显示的数据库，需要把它插入至少一个文件
use mydb
db.movie.insert({"name":"tutorials yiibai"})
show dbs

cd $MONGODB_PATH
$ ./mongod --dbpath=/data/db --rest     #启动数据库

$ ./mongo   #进入命令行
db.runoob.insert({x:10})
WriteResult({ "nInserted" : 1 })
db.runoob.find()
{ "_id" : ObjectId("5604ff74a274a611b0c990aa"), "x" : 10 }

show dbs   #显示所有数据的列表。
db     #显示当前数据库对象或集合
use chatdb     #连接到一个指定的数据库。

db.createUser(
  {
    user: "mongo",
    pwd: "mongo",
    roles:
    [
      {
        role: "userAdminAnyDatabase",
        db: "admin"
      }
    ]
  },
  { w: "majority" , wtimeout: 5000 }
) 

show users

db.dropUser('userName')

db.createCollection('person')

db.person.find()


有一些数据库名是保留的，可以直接访问这些有特殊作用的数据库。
admin： 从权限的角度来看，这是"root"数据库。要是将一个用户添加到这个数据库，这个用户自动继承所有数据库的权限。一些特定的服务器端命令也只能从这个数据库运行，比如列出所有的数据库或者关闭服务器。
local: 这个数据永远不会被复制，可以用来存储限于本地单台服务器的任意集合
config: 当Mongo用于分片设置时，config数据库在内部使用，用于保存分片的相关信息。

mongodb中没有模糊查询，可用正则表达式代替：new Criteria("name").regex(nameCondition);