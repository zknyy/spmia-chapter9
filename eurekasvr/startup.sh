#!/bin/sh
echo "********************************************************"
echo "Starting the Eureka Server"
echo "********************************************************"

export SERVER_PORT="8761"

java -Djava.security.egd=file:/dev/./urandom \
     -jar /Users/demo/Desktop/STS-workspaces-sts-3.9.3.RELEASE/ch9/spmia-chapter9/eurekasvr/target/eurekasvr-0.0.1-SNAPSHOT.jar
