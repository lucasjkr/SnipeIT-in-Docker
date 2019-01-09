FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    		apt-transport-https ca-certificates \
    		pwgen \
    		tzdata && \
    apt-get update && apt-get install -y --no-install-recommends \
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
            git && \
     #       nano && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
            \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
#    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') \
#            { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } \
#            echo PHP_EOL;" && \
    php composer-setup.php \
        --filename=composer \
        --install-dir=/usr/local/bin && \
    php -r "unlink('composer-setup.php');"

WORKDIR /var/www/

# Remove default HTML directory
RUN rm -rf /var/www/html

RUN git clone https://github.com/lucasjkr/snipe-it.git html

WORKDIR /var/www/html
RUN git checkout master
RUN composer install && \
    rm -rf /root/.composer/cache/*
RUN chmod -R 777 /var/www/html/storage && \
    chmod -R 777 /var/www/html/storage/app && \
    chmod -R 777 /var/www/html/storage/framework && \
    chmod -R 777 /var/www/html/storage/logs && \
    chmod -R 777 /var/www/html/bootstrap/cache && \
    chmod -R 777 /var/www/html/public/uploads

COPY config/snipe.env .env
RUN php artisan key:generate && \
    php artisan optimize

RUN echo "Completed installation, exiting so that Nginx and PHP-FPM can take over"
