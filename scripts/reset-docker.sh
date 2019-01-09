#/bin/bash
docker container prune -f
docker volume prune -f
docker network prune -f
docker image prune -f -a
docker system prune -f
