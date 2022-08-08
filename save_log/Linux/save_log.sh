#!/bin/sh
# 可编辑的内容!!!
# 服务器生成的日志名字叫啥名就填写啥名不然是没有用的 (latest.log 或 server.log) 大部分的服务端都是这俩种日志文件
log_name="server.log"
# 下面的代码不能动!!!
cd ./logs
count_b=2
run=114514
for ((count_a=1;count_a<=$count_b;count_a++));
do
if [ "$run" = "114514" ];then
# 查看日志文件是否存在 存在则自动进入下一阶段 不存在则退出
	if [ -f $log_name ];then
		log_time=$(stat -c %y $log_name |awk '{print $1}')
		run=1919810
	else
		echo "无法找到 $log_name 文件"
		exit
	fi
# 遍历压缩后的日志文件的编号是否存在 存在+1 不存在则开始压缩保存并退出
elif  [ "$run" = "1919810" ];then
	if [ -f $log_time-$count_a.log.gz ];then
		let count_b+=1
	else
		mv $log_name $log_time-$count_a.log
		gzip $log_time-$count_a.log
		exit
	fi
else
	echo "出错"
	exit
fi
done