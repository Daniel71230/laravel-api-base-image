# Tiek lejupielādēts PHP docker attēls no Dockerhub vietnes
FROM php:8.1-fpm as php

# PHP OPCACHE mainīgu definēšana
ENV PHP_OPCACHE_ENABLE=1
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS=1
ENV PHP_OPCACHE_REVALIDATE_FREQ=1
ENV PHP_OPCACHE_ENABLE_CLI=0

# Atkarīgo bibliotēku lejupielādēšana
RUN apt-get update && apt-get install -y unzip libpq-dev libcurl4-gnutls-dev nginx libonig-dev

# PHP, Docker un mysql paplašinājumu lejupielādēšana
RUN docker-php-ext-install mysqli pdo pdo_mysql bcmath curl opcache mbstring

# Composer failu kopēšana
COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

