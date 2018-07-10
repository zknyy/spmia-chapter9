#!/bin/sh

echo "********************************************************"
echo "Waiting for the eureka server to start on port $EUREKASERVER_PORT"
echo "********************************************************"
while ! `nc -z 127.0.0.1 $EUREKASERVER_PORT`; do sleep 3; done
echo "******* Eureka Server has started"


echo "********************************************************"
echo "Waiting for the database server to start on port $DATABASESERVER_PORT"
echo "********************************************************"
while ! `nc -z 127.0.0.1 $DATABASESERVER_PORT`; do sleep 3; done
echo "******** Database Server has started "

echo "********************************************************"
echo "Waiting for the configuration server to start on port $CONFIGSERVER_PORT"
echo "********************************************************"
while ! `nc -z 127.0.0.1 $CONFIGSERVER_PORT`; do sleep 3; done
echo "*******  Configuration Server has started"


echo "********************************************************"
echo "Waiting for the kafka server to start on port  $KAFKASERVER_PORT"
echo "********************************************************"
while ! `nc -z 127.0.0.1 $KAFKASERVER_PORT`; do sleep 10; done
echo "******* Kafka Server has started"

echo "********************************************************"
echo "Waiting for the ZIPKIN server to start  on port $ZIPKIN_PORT"
echo "********************************************************"
while ! `nc -z 127.0.0.1 $ZIPKIN_PORT`; do sleep 10; done
echo "******* ZIPKIN has started"


export SERVER_PORT="8085"

echo "********************************************************"
echo "Starting the App-Organization Server"
echo "********************************************************"

java -Djava.security.egd=file:/dev/./urandom                              \
     -Dserver.port=$SERVER_PORT                                           \
     -Deureka.client.serviceUrl.defaultZone=$EUREKASERVER_URI             \
     -Dspring.cloud.config.uri=$CONFIGSERVER_URI                          \
     -Dspring.profiles.active=$PROFILE                                    \
     -Dspring.cloud.stream.kafka.binder.zkNodes=$KAFKASERVER_URI          \
     -Dspring.cloud.stream.kafka.binder.brokers=$ZKSERVER_URI             \
     -Dspring.zipkin.baseUrl=$ZIPKIN_URI                                  \
     -jar /Users/demo/Desktop/STS-workspaces-sts-3.9.3.RELEASE/ch9/spmia-chapter9/organization-service/target/organization-service-0.0.1-SNAPSHOT.jar

