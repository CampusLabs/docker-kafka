# Kafka Docker Image

Simple Dockerfile for Apache Kafka. Assumes static, default Kafka
configuration options and requires that ZooKeeper be running on
`zookeeper:2181` (use link aliasing if your ZooKeeper host name is
different).

If you need dynamic broker scaling or configuration via environment
variables, check out
[`wurstmeister/kafka-docker`](https://github.com/wurstmeister/kafka-docker).

Exposes a broker running on port 9092 and a logs volume at
`/kafka/logs`. Kafka binary tools are on the `PATH` and the default
configuration is located at `/kafka/config/server.properties`.
