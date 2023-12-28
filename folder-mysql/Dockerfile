FROM ubuntu

WORKDIR /home/project

COPY setting.sh /home/project/
RUN chmod +x /home/project/setting.sh

RUN apt update && apt install -y vim  curl net-tools lsof \
    mysql-server

RUN mkdir -p /nonexistent
RUN chown mysql:mysql /nonexistent

COPY init.sql /docker-entrypoint-initdb.d/init.sql
COPY my.cnf /etc/mysql/my.cnf


ENV MYSQL_ROOT_PASSWORD=1234
ENV MYSQL_DATABASE=board_back
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=1234
ENV MYSQL_PORT=3306

EXPOSE 3306

RUN service mysql start && mysql -u root -p${MYSQL_ROOT_PASSWORD} -h localhost < /docker-entrypoint-initdb.d/init.sql


ENTRYPOINT ["./setting.sh"]




