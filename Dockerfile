FROM php

ENV TERM=xterm
VOLUME /data
WORKDIR /data

RUN cd / && curl -O https://getcomposer.org/composer.phar && chmod +x /composer.phar

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive apt install git nano curl wget libzip-dev -y && \
    docker-php-ext-install -j3 pdo pdo_mysql mysqli && \
    yes '' | pecl install zip && docker-php-ext-enable zip && \
    apt-get -y autoremove && \
    apt-get -y clean
