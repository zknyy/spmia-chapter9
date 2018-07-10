#!/bin/sh
echo "********************************************************"
echo "Starting the Zuul Server"
echo "********************************************************"

export SERVER_PORT="5555"

java -Djava.security.egd=file:/dev/./urandom -Dserver.port=$SERVER_PORT   \
     -Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI   \
     -Dspring.cloud.config.uri=$CONFIGSERVER_URI                \
     -Dspring.profiles.active=$PROFILE                          \
      -Dspring.zipkin.baseUrl=$ZIPKIN_URI                       \
     -jar /Users/demo/Desktop/STS-workspaces-sts-3.9.3.RELEASE/ch9/spmia-chapter9/zuulsvr/target/zuulsvr-0.0.1-SNAPSHOT.jar
