#!/bin/sh
#功能慢慢的实现吧
#毕竟要搞的判断一大堆
echo "========================"
echo "MC服务器环境部署脚本"
echo "https://github.com/stevei5mc/McStartServer"
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
		echo -e "\033[32m 开始下载Start1.sh \033[0m"
		wget https://raw.githubusercontent.com/stevei5mc/McStartServer/main/Linux/Start1.sh
		echo -e "\033[32m 下载完成，即将赋予可执行权限 \033[0m"
		chmod 755 Start1.sh
		echo -e "\033[32m 已赋予可执行权限 \n 把Start1.sh放到服务端根目录，安照注释填写后输入 sh ./Start1.sh方可运行服务器 \033[0m"
		exit
	elif [ "$menu3" = "2" ];then
		echo -e "\033[32m 开始下载Start2.sh \033[0m"
		wget https://raw.githubusercontent.com/stevei5mc/McStartServer/main/Linux/Start2.sh
		echo -e "\033[32m 下载完成，即将赋予可执行权限 \033[0m"
		chmod 755 Start2.sh
		echo -e "\033[32m 已赋予可执行权限 \n 把Start2.sh放到服务端根目录，安照注释填写后输入 sh ./Start2.sh方可运行服务器 \033[0m"
	else
		echo -e "\033[31m 参数不合法，请确保在选项范围之内 \033[0m"
		exit
	fi
