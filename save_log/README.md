# 服务器日志保存脚本
## 描述
> 该脚本解决了原来服务器只能保留一定数量的日志文件
> 使用后可以服务器运行期间的所有日志文件给保存好
## 使用方法
### windows 系统
> **敬请期待**
### Linux 系统
> 在启动脚本添加调用代码
> 示例代码 **这只是个示例代码**
```
#!/bin/sh
sh ./save_log.sh
java -XX:+UseCompressedOops -XX:+AggressiveOpts -Xms1g -Xmx1g -jar server.jar
```