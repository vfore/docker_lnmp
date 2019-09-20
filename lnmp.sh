#! /bin/bash

mkdir -p /home/server/mysql/8/conf.d
cp ./mysql/8/my.cnf /home/server/mysql/8/
cp ./mysql/8/conf.d/* /home/server/mysql/8/conf.d/

mkdir -p /home/server/nginx/conf.d
cp ./nginx/nginx.conf /home/server/nginx/
cp ./nginx/conf.d/* /home/server/nginx/conf.d/

mkdir -p /home/server/php/7.3
cp ./php-fpm/7.3/php.ini /home/server/php/7.3

docker-compose up -d | tee -a ./lnmp_install.log
docker-compose restart