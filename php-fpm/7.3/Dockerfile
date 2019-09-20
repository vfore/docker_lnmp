FROM php:7.3-alpine
MAINTAINER vfore "timesdev@163.com"
# 更换成阿里云源
RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories

RUN apk add --no-cache autoconf g++ libtool make libxml2-dev linux-headers libmcrypt-dev icu icu-dev icu-libs gettext-dev freetype-dev libjpeg-turbo-dev libpng-dev libxslt-dev libzip-dev bzip2-dev

# 安装php扩展
RUN docker-php-ext-install pdo_mysql && docker-php-ext-install mysqli && docker-php-ext-install bcmath && docker-php-ext-install intl \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ && docker-php-ext-install gd \
&& docker-php-ext-install pcntl && docker-php-ext-install shmop && docker-php-ext-install soap && docker-php-ext-install sockets \
&& docker-php-ext-install sysvsem && docker-php-ext-install xmlrpc && docker-php-ext-install xsl && docker-php-ext-install wddx \
&& docker-php-ext-install opcache && docker-php-ext-install zip && docker-php-ext-install bz2

# 安装composer
RUN curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer && composer config -g repo.packagist composer https://packagist.phpcomposer.com

COPY ./redis-4.2.0.tgz /opt/redis-4.2.0.tgz

# 安装redis扩展
RUN cd /opt \
#&& wget http://pecl.php.net/get/redis-4.2.0.tgz \
&& tar -zxvf ./redis-4.2.0.tgz \
&& cd redis-4.2.0 \
&& phpize \
&& ./configure --with-php-config=/usr/local/bin/php-config \
&& make && make install \
&& echo "extension=redis.so" > /usr/local/etc/php/conf.d/redis.ini

WORKDIR /home/www