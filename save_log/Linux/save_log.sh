#!/bin/bash
# 可编辑的内容!!!
# 服务器生成的日志名字叫啥名就填写啥名不然是没有用的 (latest.log 或 server.log) 大部分的服务端都是这俩种日志文件
log_name="server.log"
# 下面的代码不能动!!!
cd ./logs
count_b=2
run=114514
if [ -f $log_name ];then
	log_time=$(stat -c %y $log_name |awk '{print $1}')
	for ((count_a=1;count_a<=$count_b;count_a++));do
		if [ -f $log_time-$count_a.log.gz ];then
			let count_b+=1
		else
			mv $log_name $log_time-$count_a.log
			gzip $log_time-$count_a.log
			exit
		fi
	done
else
	echo "无法找到 $log_name 文件"
	exit
fi