#!/bin/bash

_self="${0##*/}"


date=$(date '+%Y%m%d_%H%M%S')


line="************************ $(date): $_self | docker build enginx sevice***********************"
echo $line
echo $line >> ./log
docker build  -t anyvision_nginx:alpine ./alpine/



line="************************ $(date): $_self | docker run enginx sevice***********************"
echo $line
echo $line >> ./log
docker run -it \
  -p 8080:8080 \
  -v /AnyVision/ex2_nginx/nginx_files/:/etc/nginx \
  -v /AnyVision/ex2_nginx/nginx_files/logs/:/var/log/nginx  \
  -v /AnyVision/ex2_nginx/nginx_files/html/:/var/www/html  \
  dudi938/anyvision_nginx:alpine
