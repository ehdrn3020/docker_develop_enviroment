#!/bin/bash
set -e

service ssh start

# 처음 한 번만 포맷하도록 체크 파일 사용
if [ ! -f /var/hadoop_namenode_formatted ]; then
  echo "Formatting HDFS NameNode..."
  ${HADOOP_HOME}/bin/hdfs namenode -format -force -nonInteractive
  touch /var/hadoop_namenode_formatted
fi

echo "Starting HDFS..."
${HADOOP_HOME}/sbin/start-dfs.sh

echo "Starting YARN..."
${HADOOP_HOME}/sbin/start-yarn.sh

# 데몬 로그를 붙잡기 위해 tail
tail -f ${HADOOP_HOME}/logs/* &
wait
