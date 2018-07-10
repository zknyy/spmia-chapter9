#!/bin/sh
echo "********************************************************"
echo "Starting the Logspout Server"
echo "********************************************************"

docker run -d --name="logspout4ch9" \
    --volume=/var/run/docker.sock:/var/run/docker.sock \
    gliderlabs/logspout \
    syslog+tls://logs4.papertrailapp.com:26856

sleep 3
docker ps

