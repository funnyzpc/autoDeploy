@echo off

IF "%1%"=="" goto ERROR
IF "%2%"=="" goto ERROR
IF "%3%"=="" goto ERROR

set VALUE1=%1%
set VALUE2=%2%
set VALUE3=%3%
set THIS_PATH=%cd%

%mvn打包%
call mvn install package -Dmaven.test.skip=true

%本地jar包上传至linux,并调用linux部署脚本%
IF "%2%" == "test"  (
    echo "Update to > test"
    pscp  -P 22 -pw PASSWORD %THIS_PATH%\%VALUE1%\target\%VALUE1%.jar root@192.168.10.101:/data/%VALUE3%
    echo "DEPLOY to > test"
    plink -pw PASSWORD -P 22  root@192.168.10.101 "/bin/sh /data/%VALUE3%/deploy.sh"
    goto :SUCCESS
    )

IF "%2%" == "uat" (
    echo "Update to > UAT"
    pscp  -P 22 -pw PASSWORD %THIS_PATH%\%VALUE1%\target\%VALUE1%.jar root@192.168.10.101:/data/%VALUE3%
    echo "DEPLOY to > UAT"
    plink -pw PASSWORD -P 22  root@192.168.10.101 "/bin/sh /data/%VALUE3%/deploy.sh"
    goto :SUCCESS
    )

IF "%2%"=="product" (
     echo "Update to > PRODUCT"
     pscp  -P 22 -pw PASSWORD %THIS_PATH%\%VALUE1%\target\%VALUE1%.jar root@192.168.10.101:/data/%VALUE3%
     echo "DEPLOY to>PRODUCY"
     plink -pw PASSWORD -P 22  root@192.168.10.101 "/bin/sh /data/%VALUE3%/deploy.sh"
     goto :SUCCESS
    )

@echo on

:ERROR
echo ERROR,please check !
pause

:SUCCESS

%auther by funnyzpc%



echo success!
pause