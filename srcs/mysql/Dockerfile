FROM alpine:3.13.0

RUN apk add mysql mysql-client supervisor telegraf --no-cache

RUN mkdir -p /run/mysqld

COPY ./start.sh /tmp/
COPY ./create.sql /tmp/
#COPY ./wordpress.sql /tmp/
COPY ./telegraf.conf /etc/telegraf.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./my.cnf /etc/my.cnf
RUN chmod +x /tmp/start.sh

EXPOSE 3306
CMD ["/tmp/start.sh"]
