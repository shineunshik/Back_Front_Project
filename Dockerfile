FROM nginx

WORKDIR /home/project

COPY Project /home/project
COPY setting.sh /home/project

RUN chmod +x /home/project/requirements.txt
RUN chmod +x /home/project/setting.sh

RUN apt update && apt install -y lsof vim python3 python3-pip python3-venv nginx
RUN python3 -m venv venv && . /home/project/venv/bin/activate &&  pip install -r requirements.txt

COPY default /etc/nginx/conf.d/default.conf

ENTRYPOINT ["./setting.sh"]
