## docker image
```declarative
https://hub.docker.com/_/clickhouse
```

## connect container clickhouse
```aiignore
docker exec -it clickhouse clickhouse-client
```

## kafka data load
```aiignore
# create topic
/opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --create \
  --topic user_events \
  --partitions 1 \
  --replication-factor 1


# create clickhouse streaming table
CREATE TABLE user_events_kafka
(
    user_id UInt64,
    event String,
    ts DateTime
)
ENGINE = Kafka
SETTINGS
    kafka_broker_list = 'kafka:9092',
    kafka_topic_list = 'user_events',
    kafka_group_name = 'clickhouse_consumer',
    kafka_format = 'JSONEachRow',
    kafka_num_consumers = 1;

# create clickhouse storage table
CREATE TABLE user_events
(
    user_id UInt64,
    event String,
    ts DateTime
)
ENGINE = MergeTree
ORDER BY (ts, user_id);

# create materialized view
CREATE MATERIALIZED VIEW user_events_mv
TO user_events
AS
SELECT
    user_id,
    event,
    ts
FROM user_events_kafka;

# kafka producer data insert
/opt/kafka/bin/kafka-console-producer.sh \
  --bootstrap-server localhost:9092 \
  --topic user_events
{"user_id": 1, "event": "login", "ts": "2026-02-06 10:01:00"}
{"user_id": 2, "event": "click", "ts": "2026-02-06 10:02:00"}

# check clickhouse table
SELECT * FROM user_events;

```