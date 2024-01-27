@echo off
::下一行和下下一行别动;下一行和下下一行别动;下一行和下下一行别动
set cq=0
set stop_server_time=暂无数据
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
set server_jar_name=server
::设置重启等待时间
set restart_time=20
title [%server_name%] [%server_IP%:%server_port%] 重启[%cq%]次 最大在线[%max-players%]人 最大内存[%ram_Xmx%] 上次关服重启时间[%stop_server_time%]
echo.
echo -------------------------------------------------------------------------------------------
echo.
echo 当前服务器信息: 
echo 服务器名[%server_name%] 重启次数[%cq%次] 上次关服重启时间[%stop_server_time%]
echo 最小内存[%ram_Xms%] 最大内存[%ram_Xmx%]
echo iP端口[%server_IP%:%server_port%] 最大在线[%max-players%]人
echo.
echo Tips:如果您需要关闭服务端请输入stop命令后关闭本窗口；以防数据丢失,导致回档。
echo.
echo -------------------------------------------------------------------------------------------
echo 服务器启动时间 %date:~0,4%/%date:~5,2%/%date:~8,2%-%time:~0,2%:%time:~3,2%:%time:~6,2%
echo -------------------------------------------------------------------------------------------
echo.
%java_version% -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms%ram_Xms% -Xmx%ram_Xmx% -jar %server_jar_name%.jar
echo.
echo -------------------------------------------------------------------------------------------
echo.
echo 服务端出现异常或被手动关闭 请等待 %restart_time% 秒后自动重启服务器
echo 服务器关闭时间已记录 &set stop_server_time=%date:~0,4%/%date:~5,2%/%date:~8,2%-%time:~0,2%:%time:~3,2%:%time:~6,2%
echo.
echo -------------------------------------------------------------------------------------------
echo.
ping 127.0.0.1 -n %restart_time% >nul
set /a cq=%cq%+1
goto mc
pause