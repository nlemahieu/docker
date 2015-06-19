FROM ubuntu:14.04

RUN apt-get update && \
apt-get install -y mysql-server

ENV MYSQL_ROOT_PASSWORD: root
ENV MYSQL_USER: root
ENV MYSQL_PASSWORD: root

CMD ["mysqld_safe"]