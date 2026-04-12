FROM php:8.4.5-apache

RUN a2enmod rewrite \
 && apt update \
 && apt install -y \
 && docker-php-ext-install mysqli pdo pdo_mysql

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd

RUN docker-php-ext-install mysqli pdo_mysql

