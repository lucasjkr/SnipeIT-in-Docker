FROM php:7.2-fpm

# Update packages and install composer and PHP dependencies.
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libpq-dev \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libbz2-dev \
    cron \
    && pecl channel-update pecl.php.net \
    && pecl install apcu \
# PHP Extensions
    && docker-php-ext-install mbstring pdo pdo_mysql pcntl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install zip \
# Memory Limit
    && echo "memory_limit=2048M" > $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "max_execution_time=900" >> $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "extension=apcu.so" > $PHP_INI_DIR/conf.d/apcu.ini \
    && echo "post_max_size=20M" >> $PHP_INI_DIR/conf.d/memory-limit.ini \
    && echo "upload_max_filesize=20M" >> $PHP_INI_DIR/conf.d/memory-limit.ini \
# Time Zone
    && echo "date.timezone=${PHP_TIMEZONE:-UTC}" > $PHP_INI_DIR/conf.d/date_timezone.ini \
# Display errors in stderr
    && echo "display_errors=stderr" > $PHP_INI_DIR/conf.d/display-errors.ini \
# Disable PathInfo
    && echo "cgi.fix_pathinfo=0" > $PHP_INI_DIR/conf.d/path-info.ini \
# Disable expose PHP
    && echo "expose_php=0" > $PHP_INI_DIR/conf.d/path-info.ini \
# Allow environmental variables
    && echo "clear_env=no" > $PHP_INI_DIR/conf.d/environment.ini \
# Install Composer
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && touch /var/log/cron.log

ENTRYPOINT ["/usr/local/sbin/php-fpm", "-F", "-R"]

EXPOSE 9000