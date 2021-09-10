#!/bin/bash

path="/home/jesse/env/frpc/frpc"
log_path="."
shell_name=$0

frpc_process=`ps -ef | grep frpc | grep -v "grep" | grep -v $shell_name`
if [ "$frpc_process" != "" ]; then
        echo "frpc client is already running."
else
	nohup ${path}/frpc -c ${path}/frpc.ini > ${log_path}/frpc.log 2>&1 &
        echo "Start frpc success."
fi
