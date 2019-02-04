#SNIPE-IT in Docker

## Requirements
I have only tested on Ubuntu Server 18.04 with:

- The version of Docker included with the distribution
- The latest versions of Docker and Docker-Compose from Docker

## Installation
Clone the Github repository

    git clone https://github.com/lucasjkr/SnipeIT-in-Docker snipe
    cd snipe
    cp .env.example .env

Edit the .env file to match your environment (see below).

If you already have SSL keys, copy them into the `opt` directory, named:

* Certificate: `nginx-cert.pem`
* Keyfile: `nginx-key.pem`

Otherwise run `bash scripts/generate-ssl-keys.sh` to make self-signed keys.

    docker-compose up -d
    docker exec snipe_php php artisan key:generate --env=local`
    bash update.sh
    
After the update is complete, you can now login to your services at:

* Snipe: `https://<<your-url>>/`
* PhpMyAdmin: `https://<<your-url>>/pma`

## Editing your .env file

Your default .env file looks like this:

    # The URL of your site
    SNIPE_FQDN=my.site.com
    
    # NGinx ports
    NGINX_HTTP_PORT=80
    NGINX_HTTPS_PORT=443
    
    # Password for the root MariaDB user (both databases)
    MYSQL_ROOT_PASSWORD=mysql_root_pass
    
    # Credentials for Snipe's database
    SNIPE_DB=snipe
    SNIPE_DB_USER=snipeuser
    SNIPE_DB_PASS=snipepass
    
    # Credentials to database that PhpMyAdmin uses for housekeeping
    PMA_DB=phpmyadmin
    PMA_USER=pmauser
    PMA_PASS=pmapass
    PMA_SECRET=012345678901234567890123456789012  # Must be 32 Characters

While this should be sufficient for you to proceed, it's best that you make edits as follows:

`SNIPE_FQDN:` Set the base URL of your site here - both Nginx and Snipe use this information

`NGINX_HTTP_PORT:` All port 80 does is redirect to Snipe's SSL port; but if you want the redirect to be on another port, change it here

`NGINX_HTTPs_PORT:`  This is the HTTPS port that Snipe will be accessible over

`MYSQL_ROOT_PASSWORD:` You won't need this for day to day, but if you ever need to log into MariaDB as the root user, this will be your password

`SNIPE_DB`, `SNIPE_DB_USER` and `SNIPE_DB_PASS:` credentials used by Laravel for accessing database; you can also access through PhpMyAdmin

`PMA_DB`, `PMA_USER` and `PMA_PASS`: credentials that PhpMyadmin uses to store its own recordkeeping data.

`PMA_SECRET` used my PhpMyAdmin to for setting/generating cookies


## Updates

Periodically, the Snipe developers update their code - to accomodate this, you can run `update.sh` - this:
1. puts the app in offline mode
2. downloads any new code from Github
3. updates composer dependencies
4. runs any new database migrations
5. brings the application back online

# Final word

This is by no means the authoritative source for anything. I reserve the right to make changes that could potentially break things. In particular, watch the `.env.example` file for changes, as well as this document.