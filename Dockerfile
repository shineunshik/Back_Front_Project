FROM ubuntu
  
WORKDIR /home/project

COPY Back/BE /home/project/BE
COPY Front/FE /home/project/FE
COPY setting.sh /home/project/

RUN chmod 755 /home/project/BE
RUN chmod 755 /home/project/FE
RUN chmod +x /home/project/setting.sh


#Spring boot package install & build(gradle install) & nginx & mysql-server install
RUN apt update && apt install -y vim openssh-server curl net-tools wget unzip lsof \
    openjdk-8-jdk nginx mysql-server
RUN wget https://services.gradle.org/distributions/gradle-4.10.2-bin.zip \
    && mkdir /opt/gradle \
    && unzip -d /opt/gradle gradle-4.10.2-bin.zip \
    && export PATH=$PATH:/opt/gradle/gradle-4.10.2/bin \
    && echo 'export PATH=$PATH:/opt/gradle/gradle-4.10.2/bin' >> ~/.bashrc
RUN cd /home/project/BE \
    && chmod +x gradlew \
    && ./gradlew build

#mysql 설정
RUN mkdir -p /nonexistent
RUN chown mysql:mysql /nonexistent

COPY init.sql /docker-entrypoint-initdb.d/
COPY my.cnf /etc/mysql/my.cnf

ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=board_back
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=1234
ENV MYSQL_PORT=3306

EXPOSE 3306

RUN service mysql start && mysql -u root -p${MYSQL_ROOT_PASSWORD} -h localhost < /docker-entrypoint-initdb.d/init.sql

#nginx 설정
COPY default /etc/nginx/sites-available/default

#react package install & node.js install
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs
RUN cd /home/project/FE \
    && npm install react-scripts --save \
    && npm install	    

#react build
RUN cd /home/project/FE \
    && npm run build

ENTRYPOINT ["./setting.sh"]
