FROM ubuntu:14.04

RUN apt-get install -y wget

RUN echo "deb http://download.virtualbox.org/virtualbox/debian trusty contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

RUN wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -

RUN apt-get update && \
apt-get install -y curl && \
apt-get install -y unar && \
apt-get install -y virtualbox-4.3

RUN curl -s https://raw.githubusercontent.com/xdissent/ievms/master/ievms.sh | bash

# Replace 1000 / 1000 by your user id and group id
RUN export uid=1887963959 gid=1001 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown ${uid}:${gid} -R /home/developer

USER developer

RUN usermod -G vboxusers -a developer
RUN /etc/init.d/vboxdrv setup

ENV HOME /home/developer

CMD /usr/bin/virtualbox