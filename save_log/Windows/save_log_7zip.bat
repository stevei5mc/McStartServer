@echo off
setlocal enabledelayedexpansion
:: 可编辑的内容!!!
:: 服务器生成的日志名字叫啥名就填写啥名不然是没有用的 (latest.log 或 server.log) 大部分的服务端都是这俩种日志文件
set logName=server.log
:: 7-Zip的安装路径，根据实际情况修改
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"
::不可编辑内容
cd .\logs
if exist %logName% (
    echo 找到文件 %logName%，开始执行日志保存任务。
    :: 获取文件的修改时间
    for %%A in (%logName%) do (
        set "fileDate=%%~tA"
    )
    set "fileDate=!fileDate:/=-!"
    set "logTimeFile=!fileDate:~0,10!"
) else (
    echo 无法找到文件 %log_name%，本次任务结束
    exit
)
set countThis=1
set countMax=2
:loop
if exist %logTimeFile%-%countThis%.log.gz (
    set /a countMax+=1
    set /a countThis+=1
    set /a countMax+=1
    goto loop
) else (
    echo 日志保存为 %logTimeFile%-%countThis%.log.7z
    ren %logName% %logTimeFile%-%countThis%.log
    %sevenZipPath% a -tgzip "%logTimeFile%-%countThis%.log.gz" "%logTimeFile%-%countThis%.log"
    del "%logTimeFile%-%countThis%.log"
)
exit