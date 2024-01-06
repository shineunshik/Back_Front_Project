#!/bin/bash

service nginx restart
. /home/project/venv/bin/activate
cd mysite
gunicorn mysite.wsgi:application --bind 0000:8000
sleep infinity
