FROM nginx

WORKDIR /home/project

COPY Front/FE /home/project/FE
COPY setting.sh /home/project/


RUN chmod 755 /home/project/FE
RUN chmod +x /home/project/setting.sh

RUN apt update && apt install -y vim curl net-tools lsof

#COPY default /etc/nginx/sites-available/default
COPY default /etc/nginx/conf.d/default.conf

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt install -y nodejs
RUN cd /home/project/FE \
    && npm install react-scripts --save \
    && npm install

RUN cd /home/project/FE \
    && npm run build

#RUN cp -r /home/project/FE/build/* /usr/share/nginx/html/

ENTRYPOINT ["./setting.sh"]













