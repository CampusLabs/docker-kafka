FROM quay.io/orgsync/java:1.8

ENV SCALA_VERSION 2.11
ENV KAFKA_VERSION 0.9.0.0

WORKDIR /kafka

RUN wget -qO- http://www.us.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz \
    | tar xvz -C /kafka --strip-components=1

COPY start-kafka /bin/
COPY server.properties /kafka/config/

VOLUME /kafka/logs
EXPOSE 9092

ENV KAFKA_CONFIG /kafka/config/server.properties
ENV PATH=$PATH:/kafka/bin
ENV BROKER_ID 0
ENV BROKER_PORT 9092
ENV ADVERTISED_HOST_NAME 172.17.0.1
ENV ADVERTISED_PORT 9092
ENV REPLICATION_FACTOR 1
ENV TOPIC_PARTITIONS 4

CMD ["start-kafka"]
