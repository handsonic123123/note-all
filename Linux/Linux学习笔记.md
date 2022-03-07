> Ubuntu使用指令

mysql
    
    记得安装mysql-server

    user mysql;
    
    select host,user,password from user;

    CREATE USER dbadmin@localhost IDENTIFIED BY 'pwd123';

    ALTER USER 'root'@'localhost' PASSWORD EXPIRE NEVER;
    
    flush privileges;

防火墙开放3306端口 - Centos7
一、firewalld 防火墙
语法命令如下：启用区域端口和协议组合

firewall-cmd [--zone=<zone>] --add-port=<port>[-<port>]/<protocol> [--timeout=<seconds>]
此举将启用端口和协议的组合。
端口可以是一个单独的端口 <port> 或者是一个端口范围 <port>-<port>。
协议可以是 tcp 或 udp。

查看 firewalld 状态

systemctl status firewalld

开启 firewalld

systemctl start firewalld

开放端口

// --permanent 永久生效,没有此参数重启后失效
firewall-cmd --zone=public --add-port=3306/tcp --permanent

重新载入

firewall-cmd --reload

查看

firewall-cmd --zone=public --query-port=3306/tcp

删除

firewall-cmd --zone=public --remove-port=3306/tcp --permanent




1.man手册汉化指令
<br>
method：

	apt update
    apt-get install manpages-zh
method2:

	wget  https://src.fedoraproject.org/repo/pkgs/man-pages-zh-CN/manpages-zh-1.5.1.tar.gz/13275fd039de8788b15151c896150bc4/manpages-zh-1.5.1.tar.gz
	tar xf manpages-zh-1.5.1.tar.gz
	cd manpages-zh-1.5.1//
	./configure --disable-zhtw  --prefix=/usr/local/zhman
	make && make install

	cd ~
	 echo "alias cman='man -M /usr/local/zhman/share/man/zh_CN' " >>.bash_profile
	source .bash_profile

2.环境变量设置路径：
	
    /etc/profile ->/etc/environment -->$HOME/.profile -->$HOME/.env

3.apt镜像源设置目录

    /etc/apt/sources.list
	apt-get update
	apt-get install openssh-server

4.查询是否安装sshd
    dpkg --get-selections | grep ssh
    netstat -tap | gerp ssh
5.获得pulic key

    vim /etc/ssh/sshd_config

1.查看ssh是否设置开启PublicKey认证登录，执行：vim /etc/ssh/sshd_config, yes为启动
	配置完成，重启ssh！service ssh restart

打开xshell，现在用密码登录就会提示(千万不要退出去操作哦，可以新开窗口，别心急，后面还有步骤没操作呢)

2.打开.ssh目录，编辑authorized_keys,一般ssh都是隐藏文件，执行：cd ~/.ssh,然后ls查看目录文件
如果隐藏目录不存在则ssh 地址即可
查看是否存在authorized_keys，如果没有需要自己创建：touch authorized_keys
在xshell中新建密码生成导向
然后将生成的值返回至authorized_key中


磁盘分区和挂载：


一.刷新内存
重要步骤：同步文件系统中的容量。

CentOS 7 开始默认使用 xfs 文件系统，使用 xfs_growfs 命令同步文件系统容量。

如果是 Ext4（包括 2、3），使用 resize2fs 命令。
    
    xfs_growfs /
    # 注意 xfs_growfs 使用 mountpoint
    #resize2fs /dev/sda1
    # resize2fs 则使用 device

二.内存添加
1.键入命令：fdish /dev/sda

        键入：m（获取帮助）

        键入：n （增加分区）

键入：p（增加主分区）

        键入：回车（起始跟结束扇区）

最后：w(退出)

2.  创建物理卷

键入命令：pvcreate /dev/sda3



设备       启动     起点     末尾     扇区 大小 Id 类型
/dev/sda1  *        2048  4196351  4194304   2G 83 Linux
/dev/sda2        4196352 37748735 33552384  16G 83 Linux
/dev/sda3       37748736 41943039  4194304   2G 82 Linux swap / Solaris



#安装oracle
##1.检查环境依赖

    rpm --query --queryformat "%{NAME}-%{VERSION}.%{RELEASE} (%{ARCH})\n" bc binutils compat-libcap1 compat-libstdc++-33 gcc gcc-c++ glibc glibc-devel ksh libaio libaio-devel libgcc libstdc++ libstdc++-devel make sysstat elfutils-libelf elfutils-libelf-devel fontconfig-devel libxcb smartmontools libX11 libXau libXtst libXrender libXrender-devel

使用yum安装 没有安装的依赖

     yum install -y 依赖1 依赖2

例如：
        
       yum install -y compat-libcap1 compat-libstdc++-33 gcc gcc-c++ glibc-devel ksh libaio-devel libstdc++-devel sysstat elfutils-libelf-devel fontconfig-devel libXrender-devel





linux redis 远程访问
配置
修改Redis配置文件/etc/redis/redis.conf，找到bind那行配置：

linux如何查找redis.conf 位置
首先 systemctl status redis


然后 cat /usr/lib/systemd/system/redis.service

vim /etc/redis/redis.conf
去掉#注释并改为：

bind 0.0.0.0
在redis3.2之后，redis增加了protected-mode，在这个模式下，即使注释掉了bind 127.0.0.1，再访问redisd时候还是报错，如下
 

(error) DENIED Redis is running in protected mode because protected mode is enabled, no bind address was specified, no authentication password is requested to clients. In this mode connections are only accepted from the loopback interface. If you want to connect from external computers to Redis you may adopt one of the following solutions: 1) Just disable protected mode sending the command 'CONFIG SET protected-mode no' from the loopback interface by connecting to Redis from the same host the server is running, however MAKE SURE Redis is not publicly accessible from internet if you do so. Use CONFIG REWRITE to make this change permanent. 2) Alternatively you can just disable the protected mode by editing the Redis configuration file, and setting the protected mode option to 'no', and then restarting the server. 3) If you started the server manually just for testing, restart it with the '--protected-mode no' option. 4) Setup a bind address or an authentication password. NOTE: You only need to do one of the above things in order for the server to start accepting connections from the outside.

 

修改办法：protected-mode no
指定配置文件然后重启Redis服务即可：

sudo redis-server /etc/redis/redis.conf
重启 redis 服务
sudo service redis-server restart
关于bind配置的含义，配置文件里的注释是这样说的：

# By default Redis listens for connections from all the network interfaces
# available on the server. It is possible to listen to just one or multiple
# interfaces using the "bind" configuration directive, followed by one or
# more IP addresses.
#
# Examples:
#
# bind 192.168.1.100 10.0.0.1
# bind 127.0.0.1
设置永久密码
Redis的安装目录中找到Redis的配置文件redis.conf（或redis.windows.conf），打开配置文件找到SECURITY部分，可以发现如下代码：

# Require clients to issue AUTH <PASSWORD> before processing any other
# commands.  This might be useful in environments in which you do not trust
# others with access to the host running redis-server.
#
# This should stay commented out for backward compatibility and because most
# people do not need auth (e.g. they run their own servers).
#
# Warning: since Redis is pretty fast an outside user can try up to
# 150k passwords per second against a good box. This means that you should
# use a very strong password otherwise it will be very easy to break.
#
# requirepass foobared
添加requirepass yourpassword（此处注意，行前不能有空格），保存之后，重启Redis服务。

 

远程连接
配置好Redis服务并重启服务后。就可以使用客户端远程连接Redis服务了。命令格式如下：

$ redis-cli -h {redis_host} -p {redis_port}
其中{redis_host}就是远程的Redis服务所在服务器地址，{redis_port}就是Redis服务端口（Redis默认端口是6379）。例如：

$ redis-cli -h 120.120.10.10 -p 6379
redis>ping
PONG
[root@43-c58542295-0048 ~]# redis-cli -h 127.0.0.1 -p 6379 -a foobared
127.0.0.1:6379> 
 