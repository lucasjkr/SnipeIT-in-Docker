#SNIPE-IT in Docker

## Setup
I have only tested on Ubuntu Server 18.04 with:

- The version of Docker included with the distribution
- The latest versions of Docker and Docker-Compose from Docker

The only other host setup item is to open up the right firewall ports on the host.
 
From the client (which can be the same machine as the host), you'll need to add an entry to your hosts file, if the name isn't registered in DNS (e.g. `snipe.docker.local`)

## Installation

Clone my repository

    git clone https://github.com/lucasjkr/SnipeIT-in-Docker snipe

Change to the SNIPE directory

    cd snipe

Copy the example .env file, and make changes as needed. The only thing you HAVE to set is the SNIPE_FQDN entry, this should be whatever name you added to your hosts file (or the URL if its a registered DNS name), but if intend to run HTTPS on a non-standard port, you should change it here.

    cp .env.example .env

Generate self-signed SSL keys

    bash scripts/generate-ssl-keys.sh

Launch SNIPE

    docker-compose up

## Notes

A default superuser has already been created, username/password are `admin`/`password`

If you're using self-signed SSL keys, you'll need to click through the warning your browser throws up.

The FIRST time you login, it will say "whoops! something went wrong", but if you reload the page, all will be fine.

Also, the APP_KEY is not going to be unique; it's within 

There might be some directories still that don't have proper write permissions. Let me know.

## Final Word

This was rapidly made for testing purposes, please don't judge me! 

I'll do some cleanup myself, but if anyone else wants to contribute, feel free to pitch in!