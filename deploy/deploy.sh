#!/bin/sh
#功能慢慢的实现吧，毕竟要搞的判断一大堆
echo "========================"
echo "MC服务器环境部署脚本"
echo "https://github.com/stevei5mc/McStartServer/tree/deploy"
echo "========================"
echo ""
echo "========================"
echo "    选    择    菜    单    "
echo " [1] 部署mc服务器环境"
echo " [2] 安装或卸载其他版本的java"
echo " [3] 获取开服脚本"
echo "========================"
echo ""
read -p "请输入你想要进行的操作代码: " menu0
	if [ "$menu0" = "1" ];then
		echo "11111"
		exit
	elif [ "$menu0" = "2" ];then
		echo "22222"
		exit
	elif [ "$menu0" = "3" ];then
		echo ""
		echo "输入完成"
		echo ""
		echo "========================"
		echo "[1]下载脚本1  [2]下载脚本2 "
		echo "========================"
		read -p "请输入你想要进行的操作代码: " menu3
	else
		echo -e "\033[31m 参数不合法，请确保在选项范围之内 \033[0m"
		exit
	fi
#第三步 下载开服脚本
	if [ "$menu3" = "1" ];then
		jiaoben=Start1.sh
		chengxu=M3
	elif [ "$menu3" = "2" ];then
		jiaoben=Start2.sh
		chengxu=M3
	else
		echo -e "\033[31m 参数不合法，请确保在选项范围之内 \033[0m"
		exit
	fi
	if [ "$chengxu" = "M3" ];then
		if [ -f $jiaoben ];then
			echo -e "\033[31m 脚本文件已存在!停止下载!  \n 请不要重复下载! \033[0m"
			exit
		fi
		echo -e "\033[32m 开始下载$jiaoben \033[0m"
		wget https://raw.githubusercontent.com/stevei5mc/McStartServer/main/Linux/$jiaoben
		if [ -f $jiaoben ];then
			echo -e "\033[32m 下载完成，即将赋予可执行权限 \033[0m"
			chmod 755 $jiaoben
			echo -e "\033[32m 已赋予可执行权限 \n 把$jiaoben放到服务端根目录，安照注释填写后输入 sh ./$jiaoben方可运行服务器 \033[0m"
			exit
		else
			echo -e "\033[31m 下载失败! 请重新下载! \n 估计是github抽风了 \033[0m"
			exit
		fi
	fi #到这就没了
