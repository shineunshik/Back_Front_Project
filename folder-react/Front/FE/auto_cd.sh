#!/bin/bash

sudo systemctl restart nginx
sudo systemctl restart mysql
sudo chmod 755 springboot-back-project-1.0-SNAPSHOT.jar

if pgrep -f "java -jar springboot-back-project-1.0-SNAPSHOT.jar" > /dev/null ; then
 kill -9 `pgrep -f "java -jar springboot-back-project-1.0-SNAPSHOT.jar"`
 nohup java -jar springboot-back-project-1.0-SNAPSHOT.jar > /dev/null 2>&1 &
 echo "실행중인 프로세스를 종료하고 재시작하였습니다."
else
 sudo nohup java -jar springboot-back-project-1.0-SNAPSHOT.jar > /dev/null 2>&1 &
 echo "새로운 프로세스를 시작하였습니다."
fi