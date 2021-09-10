#!/bin/bash
shell_name=$0

frpc_pid=`ps -ef | grep frpc | grep -v "grep" | grep -v $shell_name | awk '{print $2}'`

# kill frpc
if [ "$frpc_pid" != "" ]; then
	kill -9 $frpc_pid
	echo "Stop frpc client success."
else
	echo "frpc client is not run."
fi

