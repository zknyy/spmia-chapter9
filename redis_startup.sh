#!/bin/sh
echo "********************************************************"
echo "Starting the Redis Server"
echo "********************************************************"

docker run --name redis4ch9 -p 6379:6379 -d redis:alpine

sleep 3
docker ps

