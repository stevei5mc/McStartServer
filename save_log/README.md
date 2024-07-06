#### [返回](../README.md)|[自动备份脚本](../AutoBackup/README.md)|[服务器快速部署脚本](../deploy/README.md)|[服务器维护脚本](README)|[服务器启动脚本](../server_script/README.md)
# 服务器日志保存脚本
## 描述
- **该脚本解决了原来服务器只能保留一定数量的日志文件**  
- **使用后可以服务器运行期间的所有日志文件给保存好(如果硬盘存储空间不够保存可能会失败)**
## 使用方法
### windows 系统
- **敬请期待**
### Linux 系统
- **在启动脚本添加调用代码才可以执行**
- **示例代码 这只是个示例代码**
```sh
#!/bin/sh
sh ./save_log.sh
java -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms1g -Xmx1g -jar server.jar
```

## **注意事项**
1. **建议复制后粘贴到空白文档保存到指定编码以免遇到编码问题**  
2. **Windows脚本用`ANSI`编码，Linux脚本用`UTF-8`编码**  
3. **linux脚本记得赋予可执行权限方可执行;赋予可执行权限命令 `chmod 777 <想要赋予可执行权限的程序>`**  