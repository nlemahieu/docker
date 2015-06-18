FROM ubuntu:14.04

RUN apt-get update && apt-get install -y apache2

ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data
ENV APACHE_LOG_DIR      /var/log/apache2

RUN a2enmod rewrite
RUN a2dissite 000-default

ADD vhosts/*.conf /etc/apache2/sites-available/
ADD init.sh /tmp/init.sh

CMD sh /tmp/init.sh