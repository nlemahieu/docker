FROM ubuntu:14.04

RUN apt-get update && \
apt-get -y upgrade
RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list
RUN apt-get install -y wget && \
wget https://www.rabbitmq.com/rabbitmq-signing-key-public.asc && \
apt-key add rabbitmq-signing-key-public.asc && \
apt-get update && \
apt-get install -y rabbitmq-server

RUN rabbitmq-plugins enable rabbitmq_management
RUN gzip -d /usr/share/doc/rabbitmq-server/rabbitmq.config.example.gz
RUN touch /etc/rabbitmq/rabbitmq.config
RUN echo "[{rabbit, [{loopback_users, []}]}]." >> /etc/rabbitmq/rabbitmq.config

EXPOSE 5672
EXPOSE 15672

CMD rabbitmq-server