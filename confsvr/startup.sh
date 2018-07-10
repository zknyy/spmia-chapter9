#!/bin/sh
echo "********************************************************"
echo "Starting the Config Server"
echo "********************************************************"


export SERVER_PORT="8888"

java -Djava.security.egd=file:/dev/./urandom  \
-Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI  \
-jar /Users/demo/Desktop/STS-workspaces-sts-3.9.3.RELEASE/ch9/spmia-chapter9/confsvr/target/configurationserver-0.0.1-SNAPSHOT.jar
