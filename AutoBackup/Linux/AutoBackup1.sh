#!/bin/sh
Backup_path="【填写备份路径】"	#填写想要备份到的路径
Backup_Day="【填写天数】"	#填写理想要保存备份的天数，超过则自动删除！
Backup_Time="【填写一个时间】"	#提前多少秒通知玩家(必须填写数值)
Screen_Name="【screen名】"		#填写对应的screen程序名
Backup_Name="【备份名】" #为你的服务端的备份起个名字
server_path="【服务端所在的目录】"	#填写服务端所在的路径
#-----分割线-----
t=$Backup_Time
mkdir -p $Backup_path		#如果文件夹不存在则知道创建
for (($t;t>=1;t--));xian
do
screen -xU $screen_name -p 0 -X stuff "say §6§l注意, §c$t§6秒进行关服备份! \n"	#执行倒计时
sleep 1s
done
mkdir -p $Backup_path/$Backup_Name/temp		#为存储备份再创建一个文件夹和临时备份目录(前提是文件夹不存在)
cd $Backup_path/$Backup_Name/	#跳转到备份存储目录(临时)
screen -xU $screen_name -p 0 -X stuff "stop"
sleep 3s	#暂停3s(大概确保服务器关闭完成)
cp -r $server_path/* $Backup_path/$Backup_Name/temp
zip -r $Backup_path/$Backup_Name/$(date +%Y-%m-%d_%H-%M).zip ./*		#对备份数据进行压缩。 (建议这么写省空间 "./players/* 对玩家数据进行压缩""./worlds/* 对世界文件夹进行压缩" 有样学样写就得了 )
rm -rf $Backup_path/$Backup_Name/temp	#清理临时备份数据
find $Backup_path/$Backup_Name -mtime +$Backup_Day -name "*.zip" -exec rm -rf {} \; # 备份数据保存的天数，具体天数在 "Backup_Day=填写想要保存的天数" 超过时间则自动删除