FROM alpine:3.13.0

RUN apk add influxdb telegraf supervisor --no-cache

COPY ./start.sh /tmp/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf.conf
RUN chmod +x /tmp/start.sh

EXPOSE 8086
CMD ["/tmp/start.sh"]
