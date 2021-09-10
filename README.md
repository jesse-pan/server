# server
个人的server开发，包括各种技术栈的使用记录、脚本。

## FRP内网穿透

https://github.com/fatedier/frp

~~~shell
# 开启和创建

#!/bin/bash

path="/root/env/frp/frps"
work_path="/root/station/frps"
shell_name=$0

frps_process=`ps -ef | grep frps | grep -v "grep" | grep -v $shell_name`
if [ "$frps_process" != "" ]; then
        echo "frps server is running."
else
        nohup ${path}/frps -c ${work_path}/frps.ini > ${work_path}/frps.log 2>&1 &
        echo "start frps."
fi


# 关闭FRP
#!/bin/bash
shell_name=$0

frpc_pid=`ps -ef | grep frpc | grep -v "grep" | grep -v $shell_name | awk '{print $2}'`

# kill frpc
if [ "$frpc_pid" != "" ]; then
        kill -9 $frpc_pid
        echo "frpc client is closed"
else
        echo "frpc client is not run."
fi

# FRP的配置
# frpc
[common]
server_addr = 47.99.197.120
server_port = 7000

[ssh]
type = tcp
local_ip = 127.0.0.1
local_port = 22
remote_port = 6000

[web]
type = http
local_port = 80
custom_domains = www.akes.work

~~~



## Nginx

http://nginx.org/en/docs/beginners_guide.html



~~~shell
# 配置文件路径
/etc/nginx/nginx.conf


user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;
	# 包含自己的配置文件
    include /etc/nginx/conf.d/*.conf;
}

# 自定义代理
server {
    listen       80;
    server_name  www.akes.com;

    #access_log  /var/log/nginx/host.access.log  main;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        proxy_pass http://www.baidu.com/;
    }
    location /test {
        root /home/jesse/workstation/nginx/test;
        index index.html index.htm;
        proxy_pass https://github.com/;
    }

    location /data {
    	# 路径或url后面不加'/'，意思是以此为根路径，向后寻找子路径，如：
    	# 此时的路径即为/home/jesse/workstation/nginx/data
    	# 如果写为：
    	# root /home/jesse/workstation/nginx/data/
    	# 此时意为路径：root /home/jesse/workstation/nginx/data/data
    	# proxy_pass中亦然
        root /home/jesse/workstation/nginx/data;
        index index.html index.htm;
        # proxy_pass https://github.com/;
    }
}
~~~



## Android

IDEA和Hyper-v可能有端口冲突，导致Android Studio启动失败

https://blog.csdn.net/zzlve/article/details/105450928

Windows默认的tcp动态端口绑定范围是从1024，端口数13977，需要手动修改默认的端口绑定范围。

~~~shell
# cmd必须以管理员权限运行
netsh int ipv4 show dynamicport tcp 	# 查看默认分配的端口
netsh int ipv4 set dynamicport tcp start = 49152 num= 16383	# 设置默认分配的端口
~~~



修改Hyper-v的动态端口范围



## code-server

服务器版的vscode，github上的地址：[链接](https://github.com/cdr/code-server)



## 服务器框架

### beego

[官网](https://beego.me/docs/intro/)

[github](https://github.com/beego/beego)

