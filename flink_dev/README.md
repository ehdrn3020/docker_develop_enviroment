# Flink Local Development

Apache Flink 로컬 개발/테스트용 Docker Compose 구성입니다.

## 구성

- `jobmanager`
  - Flink JobManager
  - Web UI 포트: `8081`
- `taskmanager-1`, `taskmanager-2`
  - Flink TaskManager 2대
  - 각 TaskManager 슬롯 수: `2`

전체 기본 parallelism은 `2`로 설정되어 있습니다.

## 실행

```bash
docker compose up -d
```

Flink Web UI:

```text
http://localhost:8081
```

## 상태 확인

```bash
docker compose ps
docker logs flink-jobmanager
```

## 종료

```bash
docker compose down
```

## 참고

현재 compose 파일에는 별도 `volumes` 설정이 없습니다. 컨테이너 내부에서 생성된 데이터는 컨테이너 삭제 시 함께 사라집니다.

`8081` 포트를 이미 다른 프로세스가 사용 중이면 JobManager Web UI가 정상적으로 노출되지 않을 수 있습니다.
