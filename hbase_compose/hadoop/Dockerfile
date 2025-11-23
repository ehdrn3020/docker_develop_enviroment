FROM openjdk:8-jdk

ARG HADOOP_VERSION=3.3.1

# 필요 패키지 설치
RUN apt-get update && apt-get install -y curl ssh rsync && rm -rf /var/lib/apt/lists/*

# Hadoop 다운로드 (공식 아카이브)
RUN curl -fSL "https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz" \
    -o /tmp/hadoop.tar.gz \
 && tar -xzf /tmp/hadoop.tar.gz -C /opt \
 && ln -s /opt/hadoop-${HADOOP_VERSION} /opt/hadoop \
 && rm /tmp/hadoop.tar.gz

ENV HADOOP_HOME=/opt/hadoop
ENV PATH=${PATH}:${HADOOP_HOME}/bin:${HADOOP_HOME}/sbin

# SSH 설정 (start-dfs.sh / start-yarn.sh가 ssh 사용)
RUN ssh-keygen -q -t rsa -N '' -f /root/.ssh/id_rsa && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys && \
    echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

# 로컬 conf 복사 (호스트에서 작성)
#COPY conf/core-site.xml ${HADOOP_HOME}/etc/hadoop/core-site.xml
#COPY conf/hdfs-site.xml ${HADOOP_HOME}/etc/hadoop/hdfs-site.xml
#COPY conf/yarn-site.xml ${HADOOP_HOME}/etc/hadoop/yarn-site.xml

# entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 9870 9864 8020

CMD ["/entrypoint.sh"]
