FROM php:8.1-fpm

# Update and install necessary packages
RUN apt-get update && apt-get install -y \
    zip \
    unzip \
    libicu-dev \
    libpq-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng-dev \
    libxslt-dev \
    libzip-dev \
    libonig-dev \
    libssl-dev \
    wget \
    git \
    && apt-get clean

# Configure and install PHP extensions
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install -j$(nproc) \
    gd \
    intl \
    mbstring \
    mysqli \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    xsl \
    zip \
    bcmath \
    opcache

RUN apt-get update && apt-get install -y libxml2-dev
RUN docker-php-ext-install soap

# Download and install Composer
RUN wget https://getcomposer.org/download/2.4.2/composer.phar \
    && chmod +x composer.phar \
    && mv composer.phar /usr/local/bin/composer

# Create working directory and set permissions
RUN mkdir -p /var/www/html \
    && chown -R www-data:www-data /var/www/html
#COPY ./code/ /var/www/html/
#RUN chown -R www-data:www-data /var/www/html/storage/logs
#RUN chmod -R 777 /var/www/html/storage
RUN apt-get install -y nano curl
