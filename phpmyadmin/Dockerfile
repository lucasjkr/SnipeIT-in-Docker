FROM ubuntu:18.04 as build
# Copy env file into the container
COPY config/config.inc.php /root/config.inc.php
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         apt-transport-https ca-certificates pwgen tzdata \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         git \
         wget \
         unzip \
         zip \
         php7.2 \
         php7.2-bcmath \
         php7.2-common \
         php7.2-cli \
         php7.2-curl \
         php7.2-gd \
         php7.2-mbstring \
         php7.2-mysql \
         php7.2-xml \
         php7.2-zip \
# Install composer
# Not checking SHA signatures, even though maybe we should
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
        --filename=composer \
        --install-dir=/usr/local/bin \
    && php -r "unlink('composer-setup.php');" \
    && mkdir /var/www/ \
    && cd /var/www/ \
    && wget https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_4_8_5.zip \
    && unzip RELEASE_4_8_5.zip \
    && mv phpmyadmin-RELEASE_4_8_5 phpmyadmin \
    && cd phpmyadmin \
    && composer install \
    && mv /root/config.inc.php config.inc.php \
    && chmod 444 config.inc.php \
# Cleanup to shrink the size of the build image
    && rm /var/www/RELEASE_4_8_5.zip \
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
         zip \
         wget \
         unzip \
         tzdata \
         pwgen \
         git \
         ca-certificates \
         apt-transport-https \
    && rm /usr/local/bin/composer \
    && rm -rf /root/.composer \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*
# Create new final image
FROM alpine:3.8
COPY --from=build /var/www/phpmyadmin /var/www/phpmyadmin
