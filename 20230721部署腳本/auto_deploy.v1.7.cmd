@echo off

%chcp 65001%

%-----必要参数(需要填的!)-----%
%项目目录%
set PROJECT_DIR=D:\workspace\mee-web
%工具7z安装目录%
set ZIP_EXEC_PATH="C:\Program Files\7-Zip\7z"
%压缩文件包名称%
set FILE_NAME=mee-web.zip

%服务器IP%
set SSH_IP=192.168.23.19
%服务器端口%
set SSH_PORT=22
%服务器登录用户%
set SSH_USER=root
%服务器登录密码%
set SSH_PASSWORD=root@1233
%服务器工作目录%
set SSH_DIR=/home/nginx/tmp
%其他变量(不用动)% 
set BAT_PATH=%cd%

%-----打包-----%
call cd %PROJECT_DIR% 
if exist dist rd/s/q dist
if exist %FILE_NAME% del /a/f/q %FILE_NAME% 
call npm run build:uat --scripts-prepend-node-path=auto
call %ZIP_EXEC_PATH%  a %FILE_NAME% ./dist/**
call dir

%-----构建-----%
call echo upload file to server...
call cd %BAT_PATH%
call %BAT_PATH%\bin\pscp  -P %SSH_PORT% -pw %SSH_PASSWORD% %PROJECT_DIR%\%FILE_NAME% %SSH_USER%@%SSH_IP%:%SSH_DIR%
call echo invoke server command...
call %BAT_PATH%\bin\plink -pw %SSH_PASSWORD% -P %SSH_PORT%  %SSH_USER%@%SSH_IP% "cd %SSH_DIR% && unzip -o %FILE_NAME% && rm -rf %FILE_NAME%"

%auther by shadow%
call echo success!

pause

