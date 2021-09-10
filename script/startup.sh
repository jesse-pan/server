#!/bin/bash
log_path="/home/jesse/workstation/nginx/conf"
sub_script="/home/jesse/workstation/runtime/release/script"
# 1. start frpc
echo "get host ip:" > ${log_path}/startup.txt
ifconfig >> ${log_path}/startup.txt
echo "start frpc..." >> ${log_path}/startup.txt
bash ${sub_script}/start_frpc.sh >> ${log_path}/startup.txt
