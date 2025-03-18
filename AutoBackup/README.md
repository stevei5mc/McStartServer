[返回](../README.md)
[![1](https://img.shields.io/badge/脚本-自动备份-22?style=plastic)](../AutoBackup/README.md)
[![2](https://img.shields.io/badge/脚本-服务器快速部署-22?style=plastic&color=blue)](../deploy/README.md)
[![4](https://img.shields.io/badge/脚本-服务器日志保存-22?style=plastic&color=blue)](../save_log/README.md)
[![5](https://img.shields.io/badge/脚本-服务器启动脚本-22?style=plastic&color=blue)](../server_script/README.md)
# 我的世界服务器自动备份脚本 Test  
- **本项目Windows版还没有开发**  
- **如果你有开发能力你可以为本项目提交pr**  

## 可配置项(Linux)
- **按照提示进行配置**
```sh
Backup_path="【填写备份路径】"	#填写想要备份到的路径
Backup_Day="【填写天数】"	#填写理想要保存备份的天数，超过则自动删除！
Backup_Time="【填写一个时间】"	#提前多少秒通知玩家(必须填写数值)
Screen_Name="【screen名】"		#填写对应的screen程序名
Backup_Name="【备份名】"	#为你的服务端的备份起个名字
server_path="【服务端所在的目录】"	#填写服务端所在的路径
```
## 注意事项和建议
1. **建议复制后粘贴到空白文档保存到指定编码以免遇到编码问题，也可以直接下载脚本文件，但在修改保存时要注意编码格式的问题**
2. **Windows脚本用`ANSI`编码来进行保存，Linux脚本用`UTF-8`编码来进行保存**
3. **Linux脚本记得赋予可执行权限方可执行;赋予可执行权限命令 chmod 777 <目标程序文件>**