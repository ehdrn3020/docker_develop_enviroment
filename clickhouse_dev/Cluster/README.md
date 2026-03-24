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
│ ch-node-01  │  │ ch-node-02  │   │ ch-node-03  │  │ ch-node-04  │
│ replica 1   │  │ replica 2   │   │ replica 1   │  │ replica 2   │
│ shard 1     │  │ shard 1     │   │ shard 2     │  │ shard 2     │
└─────────────┘  └─────────────┘   └─────────────┘  └─────────────┘
```