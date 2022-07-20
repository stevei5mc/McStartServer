#!/bin/sh
cd ./logs
count_b=2
run=114514
for ((count_a=1;count_a<=$count_b;count_a++));
do
if [ "$run" = "114514" ];then
	if [ -f server.log ];then
		log_time=$(stat -c %y server.log |awk '{print $1}')
		run=1919810
	else
		echo "无法找到 server.log 文件"
		exit
	fi
elif  [ "$run" = "1919810" ];then
	if [ -f $log_time-$count_a.log.gz ];then
		let count_b+=1
	else
		mv server.log $log_time-$count_a.log
		gzip $log_time-$count_a.log
		exit
	fi
else
	echo "出错"
	exit
fi
done