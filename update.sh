#!/usr/bin/env bash
docker exec snipe_php php artisan down --message="update in progress"
docker exec snipe_php git pull
docker exec snipe_php composer update
docker exec snipe_php php artisan migrate --force
docker exec snipe_php php artisan up
