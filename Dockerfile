FROM php:5.6-apache
RUN apt-get update && apt-get install -y \
        zlib1g-dev \
        libmcrypt-dev \
    && docker-php-ext-install \
        mbstring \
        mcrypt \
        mysql \
        mysqli \
        pdo \
        pdo_mysql \
        zip
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY composer.json composer.lock /var/www/
WORKDIR /var/www/
RUN composer install
COPY . /var/www/
RUN rm -rf /var/www/html && ln -s /var/www/app/webroot /var/www/html && chown -R www-data:www-data /var/www/html
