﻿#!/bin/bash
echo ""
echo "你可以在下面的链接查看其他的启动脚本"
echo "https://github.com/stevei5mc/McStartServer"
echo ""
ReStart_Count="0" #将重启次数设置为0(别动)
while true #true执行循环，false不执行循环
do
ReStart_Time=5s  #等待多少秒后重启要加时间单位
jvm_ram_xms="512M"  #设置最小内存
jvm_ram_xmx="1024M"  #设置最大内存
jar_name="server.jar"  #开服核心的名字记得加.jar后缀名
server_name="testmc"  #服务名(方便维护用的)，比如说是生存服就将testmc改为生存服
echo "服务器已开启"
port=$(grep "server-port=" server.properties | sed 's/server-port=//g')
ip=$(grep "server-ip=" server.properties | sed 's/server-ip=//g')
maxPlayers=$(grep "max-players=" server.properties | sed 's/max-players=//g')
echo ""
echo "---------------------------------------------------"
echo ""
echo "$server_name"
echo "iP端口: [$ip:$port] 最大在线人数：[$maxPlayers] 重启[$ReStart_Count]次"
echo "最小内存为: [$jvm_ram_xms]  最大内存为: [$jvm_ram_xmx] 开服核心为: [$jar_name]"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
echo ""
java -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms$jvm_ram_xms -Xmx$jvm_ram_xmx -jar $jar_name
echo ""
echo "服务器已关闭"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
echo ""
echo "服务器异常或被手动关闭等待关闭"
echo "服务器将在$ReStart_Time后重启,按Ctrl+c关闭"
echo ""
echo "------------------------------------------------------------------------------------------------------------------------"
sleep $ReStart_Time
echo ""
let ReStart_Count+=1
done