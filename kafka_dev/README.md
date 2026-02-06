## 접속
```aiignore
docker exec -it kafka bash
경로 : /opt/kafka/
```

## 토픽 테스트
```aiignore
./kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --create \
  --topic test-topic \
  --partitions 1 \
  --replication-factor 1
  
./kafka-topics.sh --bootstrap-server localhost:9092 --list
```

## Producer
```aiignore
kafka-console-producer.sh \
  --bootstrap-server localhost:9092 \
  --topic test-topic
```

## Consumer
```aiignore
kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic test-topic \
  --from-beginning
```