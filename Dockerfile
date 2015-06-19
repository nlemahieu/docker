FROM ubuntu:14.04

RUN apt-get update && \
apt-get install -y apache2 && \
apt-get install -y libapache2-mod-php5

RUN a2enmod rewrite
RUN a2dissite 000-default

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
ENV APACHE_RUN_USER     developer
ENV APACHE_RUN_GROUP    developer
ENV APACHE_LOG_DIR      /var/log/apache2

EXPOSE 80
EXPOSE 8080

ADD vhosts/*.conf /etc/apache2/sites-available/
ADD init.sh /tmp/init.sh

CMD sh /tmp/init.sh