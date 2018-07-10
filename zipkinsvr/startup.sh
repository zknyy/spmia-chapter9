#!/bin/sh
echo "********************************************************"
echo "Starting the Zipkin Server"
echo "********************************************************"



export SERVER_PORT="9411"

java -Djava.security.egd=file:/dev/./urandom   \
     -Dserver.port=$SERVER_PORT   \
     -Dspring.profiles.active=$PROFILE                          \
      -Dspring.zipkin.baseUrl=$ZIPKIN_URI                       \
     -jar /Users/demo/Desktop/STS-workspaces-sts-3.9.3.RELEASE/ch9/spmia-chapter9/zipkinsvr/target/zipkinsvr-0.0.1-SNAPSHOT.jar

