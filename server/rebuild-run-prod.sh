#!/bin/bash

# TODO setup docker-compose.dev.yml

# docker-compose -f docker-compose.dev.yml -f docker-compose.prod.yml rm -f
# docker-compose -f docker-compose.dev.yml -f docker-compose.prod.yml build
# docker-compose -f docker-compose.dev.yml -f docker-compose.prod.yml up -d --force-recreate

docker-compose -f docker-compose.prod.yml rm -f
docker-compose -f docker-compose.prod.yml build --no-cache
# docker-compose -f docker-compose.prod.yml up -d --force-recreate
docker-compose -f docker-compose.prod.yml up --force-recreate
echo "have fun 🚀"
