FROM php:7.3-fpm
MAINTAINER vfore "timesdev@163.com"

RUN apt-get update && apt-get install -y \
vim \
git \
curl \
wget \
iputils-ping \
net-tools \
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng12*-dev \
libssl-dev \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& docker-php-ext-install mysqli \
&& docker-php-ext-install opcache

COPY ./redis-4.2.0.tgz /opt/redis-4.2.0.tgz
#COPY ./swoole-src-4.4.0.tar.gz /opt/swoole-src-4.4.0.tar.gz

# 安装composer
RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer && composer config -g repo.packagist composer https://packagist.phpcomposer.com 

# 安装redis扩展
RUN cd /opt \
#&& wget http://pecl.php.net/get/redis-4.2.0.tgz \
&& tar -zxvf ./redis-4.2.0.tgz \
&& cd redis-4.2.0 \
&& phpize \
&& ./configure --with-php-config=/usr/local/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

# 安装swoole
#RUN cd /opt \
##&& wget https://github.com/swoole/swoole-src/archive/v4.4.0.tar.gz \
#&& tar -zxvf ./swoole-src-4.4.0.tar.gz \
#&& cd swoole-src-4.4.0 \
#&& phpize \
#&& ./configure -with-php-config=/usr/local/bin/php-config --enable-openssl --enable-http2 \
#&& make && make install \
#&& echo "extension=swoole.so" > /usr/local/etc/php/conf.d/swoole.ini

WORKDIR /home/www