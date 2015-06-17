FROM ubuntu:14.04

RUN apt-get update && apt-get install -y build-essential software-properties-common
RUN apt-get install -y libsqlite3-dev ruby1.9.1-dev
RUN gem install mailcatcher
EXPOSE 1025
EXPOSE 1080
CMD ["mailcatcher", "-f", "--ip=0.0.0.0"]
