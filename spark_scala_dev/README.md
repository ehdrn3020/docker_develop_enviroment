### Install
```aiignore
# container 실행
sudo docker-compose up -d

# log 확인
sudo docker logs spark_scala_dev-resourcemanager-1

# Web UI 확인
http://123.123.123.123:9870 # 8088

# data node upload 설정
config/hdfs-site.xml 의 dfs.datanode.hostname value 값 변경
```