#!/bin/sh
ReStart_Time=5s  #等待多少秒后重启要加时间单位
jvm_ram_xms="512M"  #设置最小内存
jvm_ram_xmx="1024M"  #设置最大内存
jar_name="server.jar"  #开服核心的名字记得加.jar后缀名
server_name="testmc"  #服务名(方便维护用的)，比如说是生存服就将testmc改为生存服
echo ""
echo "服务器已开启"
echo ""
echo "---------------------------------------------------"
echo ""
echo "$server_name"
echo "服务设置信息:"
echo "最小内存设置为: $jvm_ram_xms"
echo "最大内存设置为: $jvm_ram_xmx"
echo "开服核心设置为: $jar_name"
echo ""
echo "---------------------------------------------------"
echo ""
java -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms$jvm_ram_xms -Xmx$jvm_ram_xmx  -jar $jar_name
echo ""
echo "服务器已关闭"
echo ""
echo "---------------------------------------------------"
echo ""
echo "服务器异常或被手动关闭等待关闭"
echo "服务器将在$ReStart_Time后重启"
echo "按 Ctrl+c 即可关闭"
echo ""
echo "---------------------------------------------------"
sleep $ReStart_Time
echo ""
sh ./start2.sh