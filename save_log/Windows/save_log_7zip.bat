@echo off
setlocal enabledelayedexpansion
:: 可编辑的内容!!!
:: 服务器生成的日志名字叫啥名就填写啥名不然是没有用的 (latest.log 或 server.log) 大部分的服务端都是这俩种日志文件
set log_name=server.log

cd .\logs
if exist %log_name% (
    echo 找到文件 %log_name%，开始执行日志保存任务。
    :: 获取文件的修改时间
    for %%A in (%log_name%) do (
        set "file_name=%%~nA"
        set "file_extension=%%~xA"
        set "file_path=%%~dpA"
        set "file_size=%%~zA"
        set "file_date=%%~tA"
    )
) else (
    echo 无法找到文件 %log_name%，本次任务结束
)
:: 这个暂停是方便开发用的
pause