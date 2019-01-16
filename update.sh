#!/usr/bin/env bash

docker exec php php artisan down --message="update in progress"
docker exec php git pull
docker exec php php artisan migrate --force
docker exec php php artisan up