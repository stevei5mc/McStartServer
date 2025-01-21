#### [返回](../README.md)|[自动备份脚本](../AutoBackup/README.md)|[服务器快速部署脚本](../deploy/README.md)|[服务器维护脚本](README)|[服务器启动脚本](../server_script/README.md)
# 服务器日志保存脚本
## 描述
- **该脚本解决了原来服务器只能保留一定数量的日志文件**  
- **使用后可以服务器运行期间的所有日志文件给保存好(如果硬盘存储空间不够保存可能会失败)**
## 使用方法
- **在启动脚本添加调用代码才可以执行**
- **示例代码 这只是个示例代码**
### windows 系统使用示例
```bat
@echo off
:a
start save_log_7zip.bat
java -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms1g -Xmx1g -jar server.jar
pause
goto a
```
### Windows 配置讲解
```bat
:: 可编辑的内容!!!
:: 服务器生成的日志名字叫啥名就填写啥名不然是没有用的 (latest.log 或 server.log) 大部分的服务端都是这俩种日志文件
set logName=server.log
:: 压缩软件的安装路径（支持不同压缩软件的配置项会有差异）
set sevenZipPath="C:\Program Files\7-Zip\7z.exe"
```
### Linux 系统使用示例
```sh
#!/bin/bash
sh ./save_log.sh
java -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms1g -Xmx1g -jar server.jar
```
### Linux 配置讲解
```sh
#!/bin/bash
# 可编辑的内容!!!
# 服务器生成的日志名字叫啥名就填写啥名不然是没有用的 (latest.log 或 server.log) 大部分的服务端都是这俩种日志文件
log_name="server.log"
```

## **注意事项**
1. **建议复制后粘贴到空白文档保存到指定编码以免遇到编码问题**  
2. **Windows脚本用`ANSI`编码，Linux脚本用`UTF-8`编码**  
3. **linux脚本记得赋予可执行权限方可执行;赋予可执行权限命令 `chmod 777 <想要赋予可执行权限的程序>`**  