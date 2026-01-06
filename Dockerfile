#FROM php:8.4-fpm-alpine
#
## Set working directory
#WORKDIR /var/www/html
#
#RUN docker-php-ext-install pdo pdo_mysql \
#    && apk --no-cache add libzip-dev zlib-dev libpng-dev libjpeg-turbo-dev freetype-dev \
#    && docker-php-ext-configure gd --with-jpeg --with-freetype \
#    && docker-php-ext-install zip gd \
## Install Composer \
#COPY --from=composer:latest /usr/bin/composer /usr/bin/composer \


FROM php:8.4-fpm-alpine

# Set working directory
WORKDIR /var/www/html

# Install system dependencies and PHP extensions
RUN apk --no-cache add \
    git \
    unzip \
    libzip-dev \
    zlib-dev \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    && docker-php-ext-install pdo pdo_mysql \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install zip gd

# Install Composer (multi-stage copy from official image)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer