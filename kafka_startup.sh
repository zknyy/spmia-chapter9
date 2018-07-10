#!/bin/sh
echo "********************************************************"
echo "Starting the Kafka Server"
echo "********************************************************"


docker run -d --name kafka4ch9 -p 2181:2181 -p 9092:9092 --env ADVERTISED_HOST=`docker-machine ip \`docker-machine active\`` --env ADVERTISED_PORT=9092 spotify/kafka

sleep 3
docker ps 

