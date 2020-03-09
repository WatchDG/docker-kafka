FROM opensuse/tumbleweed
RUN zypper -n update && zypper -n install wget tar java-1_8_0-openjdk
WORKDIR /kafka
RUN wget https://www.apache.org/dist/kafka/2.4.0/kafka_2.12-2.4.0.tgz -O kafka.tgz && \
tar xf kafka.tgz --strip 1 && rm kafka.tgz
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
