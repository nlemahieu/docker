FROM ubuntu:14.04
MAINTAINER Nicolas Lemahieu <nicolas.lemahieu@sensiolabs.com>

RUN apt-get update && \
apt-get -y upgrade && \
apt-get install -y build-essential g++ flex bison gperf ruby perl \
libsqlite3-dev libfontconfig1-dev libicu-dev libfreetype6 libssl-dev \
libpng-dev libjpeg-dev python libX11-dev libxext-dev git && \
git clone https://github.com/ariya/phantomjs.git
RUN cd /phantomjs && git checkout 2.0 && \
sed -i 's/read continue/continue="y"/g' /phantomjs/build.sh && \
./build.sh

# Replace 1000 / 1000 by your user id and group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer
ENV HOME /home/developer
WORKDIR /project