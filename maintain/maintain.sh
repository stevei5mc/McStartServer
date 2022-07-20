#!/bin/sh
#不会写? 会有示例文件给你参考的。
screen_name="【填写你的screen名】"		#填写你服务器对应的screen程序名
server_path="【服务端所在路径】"
Backup_path_and_name="【备份目录路径】/【备份名】"		#填写你想要备份到路径和专门备份的文件夹名；分别填写到【备份目录路径】/【备份名】
Backup_Day="【填写想要保存备份的天数】"
t2="【倒计时时间】"		#执行倒计时用于通知玩家
echo ""
echo "============================"
echo "minecraft 服务器维护脚本"
echo "[1] 手动备份服务器数据"
echo "[2] 回档(回档至指定备份)"
echo "============================"
echo ""
read -p "请输入你想要进行的操作代码: " maintain_menu0
#进行判断选择的是什么操作
#并进行相对应的操作
	if [ "$maintain_menu0" = "1" ];then
	echo "============================"
	echo "备        份        模         式"
	echo "[1]  (冷备份) 关服备份           "
	echo "[2]  (热备份) 服务器运行时备份  "
	echo "============================"
	read -p "请选择你的备份模式。: " maintain_menu1
		if [ "$maintain_menu1" = "1" ];then
			echo -e "\033[32m 你已确认，即将开始备份 \033[0m"
			mkdir -p $Backup_path_and_name/temp		#如果文件夹不存在则自动创建
			rm -rf $Backup_path_and_name/temp/*		#再清空一次临时备份文件夹，以防有旧数据
			
			for (($t2;t2>=1;t2--));
			do
			screen -xU $screen_name -p 0 -X stuff "say §6§l注意, §c$t2§6秒进行关服备份! \n"	#执行倒计时
			sleep 1s		#实现每秒发一次消息
			done
			
			echo -e "\033[32m 开始备份 \033[0m"
			screen -xU $screen_name -p 0 -X stuff "stop \n"	#关服
			sleep 4s		#用于等待服务器完成关闭操作
			cp -r $server_path/* $Backup_path_and_name/temp		#复制到另一个目录进行备份
			cd $Backup_path_and_name/temp
			zip -r $Backup_path_and_name/$(date +%Y-%m-%d_%H-%M).zip ./*		#对备份数据进行压缩。 (建议这么写省空间 "./players/* 对玩家数据进行压缩""./worlds/* 对世界文件夹进行压缩" 有样学样写就得了 )
			rm -rf $Backup_path_and_name/temp/*		#清空一次临时备份文件夹内的数据
			find $Backup_path_and_name -mtime +$Backup_Day -name "*.zip" -exec rm -rf {} \; # 备份数据保存的天数，具体天数在 "Backup_Day=填写想要保存的天数"
			echo -e "\033[32m 备份完成 \033[0m"
			exit
		elif [ "$maintain_menu1" = "2" ];then
			echo -e "\033[32m 开始备份 \033[0m"
			rm -rf $Backup_path_and_name/temp/*		#再清空一次临时备份文件夹，以防有旧数据
			screen -xU $screen_name -p 0 -X stuff "save-all \n"	#保存
			cp -r $server_path/* $Backup_path_and_name/temp		#复制到另一个目录进行备份
			cd $Backup_path_and_name/temp
			zip -r $Backup_path_and_name/$(date +%Y-%m-%d_%H-%M).zip ./*		#对备份数据进行压缩。 (建议这么写省空间 "./players/* 对玩家数据进行压缩""./worlds/* 对世界文件夹进行压缩" 有样学样写就得了 )
			rm -rf $Backup_path_and_name/temp/*		#清空一次临时备份文件夹内的数据
			find $Backup_path_and_name -mtime +$Backup_Day -name "*.zip" -exec rm -rf {} \; # 备份数据保存的天数，具体天数在 "Backup_Day=填写想要保存的天数"
			echo -e "\033[32m 备份完成 \033[0m"
		else
			echo -e "\033[31m 参数不合法，请确保在选项范围之内 \033[0m"
			exit
		fi
	elif [ "$maintain_menu0" = "2" ];then
		echo "输入你想要恢复的备份，可以在 $Backup_path_and_name 查看,.其实是选择一个压缩包"
		read -p "请输入你想要恢复的备份: " Backup_Pack
		echo -e "\033[32m 你已选择恢复的备份 $Backup_Pack 即将开始回档 \033[0m"
		cp $Backup_path_and_name/$Backup_Pack $server_path		#把选择的压缩包复制到服务端根目录
		cd $server_path
		
		for (($t2;t2>=1;t2--));
		do
		screen -xU $screen_name -p 0 -X stuff "say §6§l注意, §c$t2§6秒进行关服回档! \n"	#执行倒计时
		sleep 1s		#实现每秒发一次消息
		done
		
		echo -e "\033[32m 开始进行回档 \033[0m"
		screen -xU $screen_name -p 0 -X stuff "stop \n"	#关服
		sleep 4s		#用于等待服务器完成关闭操作
		rm -rf ./【文件夹】		#写上世界文件夹、插件文件夹、玩家数据文件夹。( " ./【文件夹】")(当然你也可以写么写 rm -rf ./*)
		unzip -o $Backup_Pack
		rm -rf $server_path/$Backup_Pack
	else
		echo -e "\033[31m 参数不合法，请确保在选项范围之内 \033[0m"
		exit
	fi