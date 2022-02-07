@echo off
::将重启次数设置为0(别动)
set cq=0
echo -------------------------------------------------------------------------------------------
echo.
echo 你可以在下面的链接查看其他的启动脚本
echo https://github.com/stevei5mc/McStartServer
echo.
echo -------------------------------------------------------------------------------------------
:mc
:: 从server.properties获得部分信息
for /f "tokens=1,* delims==" %%a in ('find "server-port="^<server.properties') do ( set server_port=%%b)
for /f "tokens=1,* delims==" %%a in ('find "max-players="^<server.properties') do ( set max-players=%%b)
for /f "tokens=1,* delims==" %%a in ('find "server-ip="^<server.properties') do ( set server_ip=%%b)
::设置用于启动的java版本 (默认填 java，当然你也可以填java的安装路径)
set java_version=java
::服务器名提示
set server_name=test
::设置最小内存
set ram_Xms=512m
::设置最大内存
set ram_Xmx=1024m
::设置开服核心名(开服核心名不用加.jar的后缀名)
set server_jar_name=20
::设置重启等待时间
set restart_time=20
title [%server_name%] [%server_IP%:%server_port%] 重启[%cq%]次 最大在线人数:[%max-players%] 最大内存:[%ram_Xmx%]
echo.
echo -------------------------------------------------------------------------------------------
echo.
echo 当前服务器信息: 
echo 服务器名:[%server_name%] 重启次数:[%cq%次]
echo 最大在线人数:[%max-players%]
echo 最小内存:[%ram_Xms%] 最大内存:[%ram_Xmx%]
echo IP[%server_IP%] 端口[%server_port%]
echo.
echo Tips:如果您需要关闭服务端请输入stop命令后关闭本窗口；以防数据丢失,导致回档。
echo.
echo -------------------------------------------------------------------------------------------
echo 现在时间[%DATE% %TIME% 服务器正在启动
echo -------------------------------------------------------------------------------------------
echo.
%java_version% -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms%ram_Xms% -Xmx%ram_Xmx% -jar %server_jar_name%.jar
echo.
echo -------------------------------------------------------------------------------------------
echo.
echo 服务端出现异常或被手动关闭 请等待 %restart_time% 秒后自动重启服务器
echo 现在时间[%DATE% %TIME%]
echo.
echo -------------------------------------------------------------------------------------------
echo.
timeout /T %restart_time% /NOBREAK
set /a cq=%cq%+1
goto mc
pause