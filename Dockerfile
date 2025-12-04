FROM php:8.2-apache

RUN apt-get update && apt-get install -y \
    libzip-dev unzip git \
    && docker-php-ext-install zip

# Włącz mod_rewrite (opcjonalnie)
RUN a2enmod rewrite

# Kopiujemy twój "silnik PDF"
COPY docker/ /var/www/html/

WORKDIR /var/www/html/

# Ustawienia Smarty (jeśli potrzebne)
RUN mkdir -p /var/www/html/compile /var/www/html/cache \
    && chown -R www-data:www-data /var/www/html

EXPOSE 80

