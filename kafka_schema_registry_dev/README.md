## Docker 실행
```aiignore
docker run -d \
  --name schema-registry \
  -p 8081:8081 \
  -e SCHEMA_REGISTRY_HOST_NAME=schema-registry \
  -e SCHEMA_REGISTRY_LISTENERS=http://0.0.0.0:8081 \
  -e SCHEMA_REGISTRY_KAFKASTORE_BOOTSTRAP_SERVERS=PLAINTEXT://kafka01:9092,PLAINTEXT://kafka02:9092,PLAINTEXT://kafka03:9092 \
  confluentinc/cp-schema-registry:latest
```
