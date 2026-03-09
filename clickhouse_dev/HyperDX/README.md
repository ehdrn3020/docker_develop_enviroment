## 개요
```declarative
- 이미 clickhouse docker가 설치되어 있다고 가정
- HyperDX 메타데이터를 저장하기 위한 MongoDB Docker 설치가 필요
```

## Install Hyper DK
```aiignore
docker compose -f docker-compose.mongodb.yml up -d
docker compose -f docker-compose.hyperdx.yml up -d
```

## MongoDB 접속
```aiignore
docker exec -it mongodb-hyperdx mongosh -u admin -p 'admin' --authenticationDatabase admin
```

## HyperDX UI 접속
```declarative
// 접속
http://localhost:8080

- 유저 계정 생성 및 로그인

- UI에서 기존 ClickHouse 데이터 소스 설정

```