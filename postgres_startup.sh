#!/bin/sh
echo "********************************************************"
echo "Starting the Redis Server"
echo "********************************************************"

docker run --name postgres4ch9 -p 5432:5432 -e "POSTGRES_USER=postgres POSTGRES_PASSWORD=p0stgr@s POSTGRES_DB=eagle_eye_local" -d postgres:9.5
sleep 3
docker ps 

