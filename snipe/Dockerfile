FROM ubuntu:18.04
# Copy env file into the container
COPY config/snipe.env /root/.env
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    		apt-transport-https ca-certificates \
    		pwgen \
    		tzdata \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
            php7.2 \
            php7.2-curl \
            php7.2-common \
            php7.2-cli \
            php7.2-mysql \
            php7.2-mbstring \
            php7.2-xml \
            php7.2-zip \
            php7.2-bcmath \
            php7.2-gd \
            git \
# Cleanup apt directories
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
# Install composer
# Not checking SHA signatures, even though maybe we should
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php \
        --filename=composer \
        --install-dir=/usr/local/bin \
    && php -r "unlink('composer-setup.php');" \
# Remove default HTML directory
    && rm -rf /var/www/html \
    && git clone https://github.com/lucasjkr/snipe-it.git /var/www/html \
# Change to Snipe repository and continue building
    && cd  /var/www/html \
    && git checkout master \
    && composer install \
    && rm -rf /root/.composer/cache/* \
# Make required directories writable
    && chmod -R 777 /var/www/html/storage \
    && chmod -R 777 /var/www/html/storage/app \
    && chmod -R 777 /var/www/html/storage/framework \
    && chmod -R 777 /var/www/html/storage/logs \
    && chmod -R 777 /var/www/html/bootstrap/cache \
    && chmod -R 777 /var/www/html/public/uploads \
# Creating APP_KEY fails currently, because the .env file says the site is in production
# looking for a solution that would generate the APP_KEY only if it's not set, regardless
# of what is set in APP_ENV
    && mv /root/.env /var/www/html/.env \
    && php artisan key:generate \
    && php artisan optimize