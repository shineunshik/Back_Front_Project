FROM ubuntu
WORKDIR /home/mysql

RUN mkdir /nonexistent && chmod 755 /nonexistent

RUN apt update && apt install -y vim curl net-tools openssh-server mysql-server lsof


ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=board_back
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=1234
ENV MYSQL_PORT=3306

COPY init.sql /docker-entrypoint-initdb.d/
COPY my.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY my.cnf /etc/mysql/my.cnf


RUN service mysql start && mysql -u root -p${MYSQL_ROOT_PASSWORD} -h localhost < /docker-entrypoint-initdb.d/init.sql


CMD service mysql start && tail -f /dev/null


