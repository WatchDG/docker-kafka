# docker-kafka
docker kafka

## example:
```
version: "3.6"
services:
  zookeeper:
    image: zookeeper:3.5.6
    hostname: zookeeper
    restart: always
    ports:
      - 2181:2181
    volumes:
      - /zookeeper/data:/data
      - /zookeeper/datalog:/datalog
  kafka:
    image: watchdg/kafka:2.4.0
    hostname: kafka
    restart: always
    ports:
      - 9092:9092
    environment:
      - KAFKA__zookeeper.connect=zookeeper:2181
      - KAFKA__advertised.listeners=PLAINTEXT://127.0.0.1:9092
      - KAFKA__group.initial.rebalance.delay.ms=3000
    volumes:
      - /kafka/data:/tmp/kafka-logs
    depends_on:
      - zookeeper
```
