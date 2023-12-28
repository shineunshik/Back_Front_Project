#!/bin/bash

#mysqld &
service nginx restart

#spring project start
cd /home/project/BE/build/libs
chmod +x springboot-back-project-1.0-SNAPSHOT.jar
nohup java -jar springboot-back-project-1.0-SNAPSHOT.jar > output.log 2>&1 &

#mysql start && background start
mysqld &
#sleep infinity 는 프로세스가 대기 상태로 진입하게 된다
sleep infinity
#아래 명령어도 프로세스를 무한히 대기 상태로 진입하게 되지만 부팅시 이전에 이미 실행중이어서 퉁돌이 난다
#tail -f /dev/null
