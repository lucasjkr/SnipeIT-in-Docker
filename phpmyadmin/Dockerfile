FROM ubuntu:18.04
RUN DEBIAN_FRONTEND=noninteractive \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
         apt-transport-https ca-certificates pwgen tzdata git \
# Cleanup apt directories
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
# Remove default HTML directory
    && rm -rf /var/www/html \
    && git clone https://github.com/phpmyadmin/phpmyadmin.git /var/www/html \
# Change to Snipe repository and continue building
    && cd  /var/www/html \
    && git checkout master \
