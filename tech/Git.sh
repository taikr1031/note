https://github.com
UID: taikr1031
PWD: tai_k_r_1031
MAIL: taikongren1@163.com

git config --global user.name "John Doe"
git config --global core.editor emacs

git config --list
git config user.name

git help config
git config --help
man git-config


#提交部分改动文件
git add -A src
git commit -a -m '123'
git push origin master

#恢复
git reset --hard origin/master

#push到github时，每次都要输入用户名和密码的问题
git remote rm origin
git remote add origin git@github.com:taikr1031/chat-weixin
git push origin 


git init

git add *.c 
git add LICENSE
git commit -m 'initial project version'

git clone https://github.com/taikr1031/ws-wx-chat ws-wx-chat    #克隆全部分支
git clone -b v1.2 https://github.com/taikr1031/ws-wx-chat ws-wx-chat-1.2    #只克隆git仓库中的一个分支
git status -s

git clone https://github.com/taikr1031/chat-weixin dddd

#查看已暂存和未暂存的修改
git diff    #工作目录中当前文件和暂存区域快照之间的差异, 也就是修改之后还没有暂存起来的变化内容
git diff --staged   #查看已暂存的将要添加到下次提交里的内容
#请注意, git diff 本身只显示尚未暂存的改动,而不是自上次提交以来所做的所有改动。 所以有时候你一下子暂存了所有更新过的文件后,运行 git diff 后却什么也没有,就是这个原因

#提交更新
git commit -a -m "commit describe..."
    #-a 选项,跳过使用暂存区域, Git 就会自动把所有已经跟踪过的文件暂存起来一并提交,从而跳过 git add 步骤
    #-m 选项,将提交信息与命令放在同一行

#更新
git pull

#删除文件
git rm -rf dir
git rm -rf a.txt
git rm --cachee a.txt
git rm log/\*.log       #删除 log/ 目录下扩展名为 .log 的所有文件
git rm \*~      #删除以 ~ 结尾的所有文件

#如果只是删除这一个文件夹的话
git rm -rf dir
git add -A
git commit -m 'remove dir'
git push origin master


#移动文件
git mv file_from file_to    #重命名

#查看提交历史
git log -p -2
    #-p 用来显示每次提交的内容差异
    #-2 来仅显示最近两次提交

#撤销操作
git commit --amend

#你提交后发现忘记了暂存某些需要的修改,可以像下面这样操作
git commit -m "first commit"
git add forgotten_file
git commit --amend

#取消暂存的文件
git reset HEAD abc.txt

#撤消对文件的修改
git checkout -- abc.txt
git status

#查看远程仓库
git remote -v 

#添加远程仓库
git remote add pb https://github.com/projName
git fetch pb    #在命令行中使用字符串 pb 来代替整个 URL。 例如,如果你想拉取 Paul 的仓库中有但你没有的信
息

#从远程仓库中抓取与拉取
git fetch [remote-name]

#推送到远程仓库
git push origin master

#查看远程仓库              {text: '<i class="ion-ios-mic icon-button icon-action" ></i>    <span class="tab-action"></span>        <i class="text-width">语音输入</i> '},

git remote show origin

#远程仓库的移除与重命名
git remote rename pb paul


分支：
    git branch v1.2 v1.1   #新建一个叫develop的分支，基于master分支
　　  git checkout v1.2  #切换到这个分支
　　  git push -u origin v1.2     #比如新建了一个叫v1.2的分支，而github网站上还没有


　　  
#完整使用Git上传项目到Github命令
登录github，创建新仓库：new repository wx-chat
cd wx-chat
rm -rf .git
git init
git remote rm origin
git remote add origin git@github.com:taikr1031/wx-chat.git
git add .
git commit -m "first commit"
git push origin +master

git remote add origin git@github.com:taikr1031/ws-wx-chat.git

系统出现如下错误：warning: LF will be replaced by CRLF
$ rm -rf .git
$ git config --global core.autocrlf false
$ git init
$ git add .


#https://github.com/taikr1031/TransferClient
#GitHub 有一个十分详细的针对数十种项目及语言的 .gitignore 文件列表,你可以在 https://github.com/github/gitignore 找到它
#ssh-keygen -t rsa -C "taikongren1@163.com"
