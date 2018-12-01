####	一键部署脚本说明
```
	由于手动上传jar包至linux，启动部署脚本较为麻烦，遂做了个一键部署脚本。
	注意！本脚本为吻逗死(windows)专用，不可在linux下使用。
```
#####	功能
+	自动maven打包
+	应用jar(或war)包上传
+	调用远程调用linux部署脚本

##### 	文件介绍:本目录包含三个文件,分别为
+	_deploy.cmd_    
	-	为部署脚本
+	_plink.exe_     
    -	吻逗死下远程执行脚本工具
+	_pscp.exe_  
	-	吻逗死下远程复制工具
+   _pagent.exe(可选)_
    -   吻逗死远程代理(秘钥)认证管理工具

#####	部署方式
+	将本文件夹下三个文件复制到项目主目录下(pom.xml同级)
+	执行cmd脚本命令 ：“deploy.cmd 参数一(应用目录,需要同jar包名称) 参数二(部署平台) 参数三(服务端应用目录)”

>>>***Auther by funnyzpc,If you want get more ,please see me by blog:[cnblogs](https://www.cnblogs.com/funnyzpc)***