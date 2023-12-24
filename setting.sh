#!/bin/bash

#mysqld &
service nginx restart

#spring project start
cd /home/project/BE/build/libs
chmod +x springboot-back-project-1.0-SNAPSHOT.jar
nohup java -jar springboot-back-project-1.0-SNAPSHOT.jar > output.log 2>&1 &

#mysql start && background start
mysqld &
tail -f /dev/null
