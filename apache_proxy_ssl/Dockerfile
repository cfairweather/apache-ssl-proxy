# Dockerfile for apache_proxy_ssl to be a proxy for other Docker containers
FROM debian:stable
MAINTAINER Cristoffer Fairweather <cfairweather@cfairweather.com>

RUN apt-get update && apt-get -y install apache2 && apt-get clean
RUN a2enmod ssl proxy proxy_http rewrite

RUN rm -rf /etc/apache2/sites-enabled/*
COPY example.conf /etc/apache2/sites-enabled/example.conf

RUN mkdir -p /opt/example
COPY example.html /opt/example/index.html


EXPOSE 80 443

VOLUME ["/var/log/apache2"]

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh 
ENTRYPOINT ["/docker-entrypoint.sh"]