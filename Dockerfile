FROM alpine:latest
MAINTAINER Nicolas Lemahieu <nicolas.lemahieu@gmail.com>

RUN apk update && \
apk upgrade && \
apk add --update curl php5-cli && \
rm -rf /var/cache/apk/* && \
mkdir -p /usr/local/bin && \
curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
chmod a+x /usr/local/bin/symfony

CMD ["/usr/local/bin/symfony"]
