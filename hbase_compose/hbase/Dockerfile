FROM amazoncorretto:8

ARG HBASE_VERSION=2.3.1
ARG HADOOP_VERSION=3.3.1

RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Hadoop client 설치 (버전 맞추기 위해)
RUN curl -fSL "https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz" \
    -o /tmp/hadoop.tar.gz \
 && tar -xzf /tmp/hadoop.tar.gz -C /opt \
 && ln -s /opt/hadoop-${HADOOP_VERSION} /opt/hadoop \
 && rm /tmp/hadoop.tar.gz

# HBase 2.3.1 설치 (아카이브 경로)
RUN curl -fSL "https://archive.apache.org/dist/hbase/2.3.1/hbase-${HBASE_VERSION}-bin.tar.gz" \
    -o /tmp/hbase.tar.gz \
 && tar -xzf /tmp/hbase.tar.gz -C /opt \
 && ln -s /opt/hbase-${HBASE_VERSION} /opt/hbase \
 && rm /tmp/hbase.tar.gz

ENV HADOOP_HOME=/opt/hadoop
ENV HBASE_HOME=/opt/hbase
ENV PATH=${PATH}:${HBASE_HOME}/bin

# 하둡 설정 (hbase에서 HDFS 접속 가능하도록)
COPY ../hadoop/conf/core-site.xml ${HADOOP_HOME}/etc/hadoop/core-site.xml
COPY ../hadoop/conf/hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml

# hbase-site.xml
COPY conf/hbase-site.xml ${HBASE_HOME}/conf/hbase-site.xml

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 16010 16020

CMD ["/entrypoint.sh"]
