#### 一、lnmp环境

1. php版本7.3
2. nginx版本为最新版
3. mysql 8.0

#### 二、前提条件

1. 安装有docker-ce
2. 安装有docker-compose
3. 端口不冲突，冲突可更改docker-compose.yml端口映射（80,443,3306,9000）
4. /home 目录下最好没有目录及文件

#### 三、安装

1. 进入到当前目录执行 sh lnmp.sh 自动进行一键安装

#### 四、其他

1. 若需其他拓展可进入容器中自行安装，或者重新构建镜像，修改Dockerfile文件
2. mysql默认账号：root，密码：123456
	
#### 五、目录结构
		/home/
		├── server                      服务目录
		│   ├── nginx                 	Nginx配置目录
		│	├── nginx.conf		Nginx默认配置文件
		│	└── conf.d		Nginx用户站点配置目录
		│   ├── mysql              	MySQL配置目录
		│	├── my.cnf		MySQL默认配置文件
		│	├── data		MySQL数据目录
		│	└── conf.d		MySQL用户配置目录
		│   ├── php                 	PHP配置目录
		│	└── php.ini             PHP配置文件
		│
		├── logs                  	日志目录
		│    ├── nginx			Nginx日志目录
		│    └── php			PHP日志目录
		└── www 			PHP代码目录和Nginx资源目录
