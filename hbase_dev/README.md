## Hadoop 설치
```aiignore
# 참조
https://hub.docker.com/r/apache/hadoop

# 컨테이너 기동
sudo docker-compose run --rm namenode hdfs namenode -format
sudo docker-compose up -d namenode datanode

# 컨테이너 삭제
sudo docker-compose rm -sf namenode

# 로그 확인
docker logs namenode --tail 50

# 접속 확인
docker exec -it namenode bash
hdfs dfs -ls /
hdfs dfs -mkdir -p /tmp /user

# 볼륨 확인
sudo docker volume ls | grep namenode
경로 : /var/lib/docker/volumes/

# 볼륨 삭제
sudo docker volume rm hbase_dev_namenode
```

## HBase 설치
```aiignore
# 참조
https://hub.docker.com/r/harisekhon/hbase/

# 접속 확인
docker exec -it hbase bash

# 프로세스 확인
ps aux | egrep 'HMaster|HRegionServer'

# 쉘 접속
hbase shell

# 상태 확인
status
status 'simple'
status 'detailed'
```