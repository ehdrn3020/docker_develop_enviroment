## process
```declarative
- 2 shard, 2 replica
- 참조 : https://clickhouse.com/docs/architecture/horizontal-scaling

                     [ Client / App ]
                            │
                            ▼
                 [ Distributed Table ]
                       (events_dist)
                            │
        ┌───────────────────┴───────────────────┐
        │                                       │
┌───────────────┐                   ┌───────────────┐
│   SHARD 1     │                   │   SHARD 2     │
│ (data group A)│                   │ (data group B)│
└───────┬───────┘                   └───────┬───────┘
        │                                   │
┌───────┴────────┐                  ┌───────┴────────┐
│                │                  │                │
┌─────────────┐  ┌─────────────┐   ┌─────────────┐  ┌─────────────┐
│ ch-node-01  │  │ ch-node-03  │   │ ch-node-02  │  │ ch-node-04  │
│ replica 1   │  │ replica 2   │   │ replica 1   │  │ replica 2   │
│ shard 1     │  │ shard 1     │   │ shard 2     │  │ shard 2     │
└─────────────┘  └─────────────┘   └─────────────┘  └─────────────┘
```

## execution
```bash
cd .\clickhouse_dev\cluster\
docker compose up -d

# 상태 확인
docker compose ps

# 로그 확인
docker compose logs -f

# ClickHouse 접속 후 클러스터 확인
docker exec -it clickhouse-01 clickhouse-client
>>>
SELECT cluster, shard_num, replica_num, host_name
FROM system.clusters
WHERE cluster = 'cluster_2S_2R'
ORDER BY shard_num, replica_num;

# 예상 결과는 대략
shard 1 replica 1 clickhouse-01
shard 1 replica 2 clickhouse-03
shard 2 replica 1 clickhouse-02
shard 2 replica 2 clickhouse-04
```