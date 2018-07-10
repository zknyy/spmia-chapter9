#!/bin/sh
echo "********************************************************"
echo "Starting the App-Licensing Server"
echo "********************************************************"

export SERVER_PORT="8080"

java -Djava.security.egd=file:/dev/./urandom                              \
     -Dserver.port=$SERVER_PORT                                           \
     -Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI             \
     -Dspring.cloud.config.uri=$CONFIGSERVER_URI                          \
     -Dspring.cloud.stream.kafka.binder.zkNodes=$KAFKASERVER_URI          \
     -Dspring.cloud.stream.kafka.binder.brokers=$ZKSERVER_URI             \
     -Dspring.zipkin.baseUrl=$ZIPKIN_URI                                  \
     -Dspring.profiles.active=$PROFILE                                    \
     -jar /Users/demo/Desktop/STS-workspaces-sts-3.9.3.RELEASE/ch9/spmia-chapter9/licensing-service/target/licensing-service-0.0.1-SNAPSHOT.jar


