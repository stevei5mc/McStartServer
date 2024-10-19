#### [返回](../README.md)|[自动备份脚本](../AutoBackup/README.md)|[服务器快速部署脚本](../deploy/README.md)|[服务器维护脚本](README)|[服务器日志保存脚本](../save_log/README.md)
# 我的世界服务器启动脚本

## **可配置项**
- **可配置项已在下方列出**
- **如果你没有相关知识，请不要修改可配置项以外的地方**
- **可配置项是在`=`后面的，例如`jvm_ram_xms="512M"`的`512M`就为可配置项, 注：`""`可加可不加，如果无法执行可尝试加上`""`**
### **Windows**
```bat
::设置用于启动的java版本 (默认填 java，当然你也可以填java的安装路径)
set java_version=java
::服务器名提示
set server_name=test
::设置最小内存
set ram_Xms=512m
::设置最大内存
set ram_Xmx=1024m
::设置开服核心名(开服核心名不用加.jar的后缀名，文件名例server.jar，就填写server)
set server_jar_name=server
::设置重启等待时间
set restart_time=20
```
### **Linux**

```sh
ReStart_Time=5s  #等待多少秒后重启要加时间单位
jvm_ram_xms="512M"  #设置最小内存
jvm_ram_xmx="1024M"  #设置最大内存
jar_name="server.jar"  #开服核心的名字记得加.jar后缀名
server_name="testmc"  #服务名(方便维护用的)，比如说是生存服就将testmc改为生存服
```

## **注意事项**
1. **建议复制后粘贴到空白文档保存到指定编码以免遇到编码问题**  
2. **Windows脚本用`ANSI`编码，Linux脚本用`UTF-8`编码**  
3. **linux脚本记得赋予可执行权限方可执行;赋予可执行权限命令 `chmod 777 <想要赋予可执行权限的程序>`**  