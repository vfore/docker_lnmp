FROM php:7.3-fpm
RUN apt-get update && apt-get install -y vim \
libfreetype6-dev \
libjpeg62-turbo-dev \
libpng12*-dev \
iputils-ping \
net-tools \
&& docker-php-ext-install pdo_mysql \
&& docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install gd \
&& curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer && composer config -g repo.packagist composer https://packagist.phpcomposer.com 
