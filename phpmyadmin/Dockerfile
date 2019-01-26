FROM ubuntu:18.04
# Copy env file into the container
COPY config/config.inc.php /root/config.inc.php
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
         apt-transport-https ca-certificates pwgen tzdata \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         wget git zip unzip php7.2 php7.2-curl php7.2-common php7.2-cli php7.2-mysql php7.2-mbstring php7.2-xml php7.2-zip php7.2-bcmath php7.2-gd \
# Cleanup apt directories
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
# Install composer
# Not checking SHA signatures, even though maybe we should
    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php \
        --filename=composer \
        --install-dir=/usr/local/bin \
    && php -r "unlink('composer-setup.php');" \
    && mkdir /var/www/ \
    && cd /var/www/ \
    && wget https://github.com/phpmyadmin/phpmyadmin/archive/RELEASE_4_8_4.zip \
    && unzip RELEASE_4_8_4.zip \
    && cd /var/www/ \
    && mv phpmyadmin-RELEASE_4_8_4 phpmyadmin \
    && cd phpmyadmin \
    && composer install \
    && mv /root/config.inc.php config.inc.php \
    && chmod 444 config.inc.php