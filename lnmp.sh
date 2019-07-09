#! /bin/bash

mkdir -p /home/server/mysql/conf.d
cp ./mysql/my.cnf /home/server/mysql/
cp ./mysql/conf.d/* /home/server/mysql/conf.d/

mkdir -p /home/server/nginx/conf.d
cp ./nginx/nginx.conf /home/server/nginx/
cp ./nginx/conf.d/* /home/server/nginx/conf.d/

mkdir /home/server/php
cp ./php-fpm/php.ini /home/server/php/

docker-compose up -d | tee -a ./lnmp_install.log
docker-compose restart
