FROM ubuntu:18.04 as build
# Copy env file into the container
COPY config/snipe.env /root/.env
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         apt-transport-https \
         ca-certificates \
         pwgen \
         tzdata \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         git \
         php7.2 \
         php7.2-bcmath \
         php7.2-cli \
         php7.2-common \
         php7.2-curl \
         php7.2-gd \
         php7.2-mbstring \
         php7.2-mysql \
         php7.2-xml \
         php7.2-zip \
# Install composer
# Not checking SHA signatures, even though maybe we should
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php \
        --filename=composer \
        --install-dir=/usr/local/bin \
    && php -r "unlink('composer-setup.php');" \
# Remove default HTML directory
    && rm -rf /var/www/html \
    && git clone https://github.com/snipe/snipe-it.git /var/www/html \
# Change to Snipe repository and continue building
    && cd  /var/www/html \
    && git checkout master \
    && composer install \
    && rm -rf /root/.composer/* \
# Make required directories writable
    && chmod -R 777 /var/www/html/storage \
    && chmod -R 777 /var/www/html/storage/app \
    && chmod -R 777 /var/www/html/storage/framework \
    && chmod -R 777 /var/www/html/storage/logs \
    && chmod -R 777 /var/www/html/bootstrap/cache \
    && chmod -R 777 /var/www/html/public/uploads \
    && mv /root/.env /var/www/html/.env \
    && php artisan optimize \
# Cleanup to shrink the size of the build image
    && apt-get remove -y \
         php7.2-zip \
         php7.2-xml \
         php7.2-mysql \
         php7.2-mbstring \
         php7.2-gd \
         php7.2-curl \
         php7.2-common \
         php7.2-cli \
         php7.2-bcmath \
         php7.2 \
         git \
         tzdata \
         pwgen \
         ca-certificates \
         apt-transport-https \
    && rm /usr/local/bin/composer \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
FROM alpine:3.8
COPY --from=build /var/www/html /var/www/html