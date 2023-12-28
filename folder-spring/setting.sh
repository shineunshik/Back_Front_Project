#!/bin/bash

cd /home/project/BE/build/libs
chmod +x springboot-back-project-1.0-SNAPSHOT.jar
nohup java -jar springboot-back-project-1.0-SNAPSHOT.jar > output.log 2>&1 &

sleep infinity
