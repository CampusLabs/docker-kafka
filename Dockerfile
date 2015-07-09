FROM orgsync/java8

ENV SCALA_VERSION 2.10
ENV KAFKA_VERSION 0.8.2.1

WORKDIR /kafka

RUN wget -qO- http://www.us.apache.org/dist/kafka/$KAFKA_VERSION/kafka_$SCALA_VERSION-$KAFKA_VERSION.tgz \
    | tar xvz -C /kafka --strip-components=1

COPY server.properties /kafka/config/

ENV PATH=$PATH:/kafka/bin

VOLUME /kafka/logs
EXPOSE 9092
CMD kafka-server-start.sh config/server.properties
