#!/bin/sh
echo "========================"
echo "MC服务器环境部署脚本"
echo "https://github.com/stevei5mc/McStartServer"
echo "========================"
#sleep 5s
echo "========================"
echo "    选    择    菜    单    "
echo " [1] 部署mc服务器环境"
echo " [2] 安装或卸载其他版本的java"
echo " [3] 获取开服脚本"
echo "========================"
echo ""
read -p "请输入你想要进行的操作代码: " menu1
	if [ "$menu1" = "1" ];then
		echo "11111"
		exit
	elif [ "$menu1" = "2" ];then
		echo "22222"
		exit
	elif [ "$menu1" = "3" ];then
		echo "33333"
		exit
	else
		echo "参数不合法，请确保在选项范围之内"
	fi
#功能慢慢的实现吧
#毕竟要搞的判断一大堆
