FROM alpine:3.13.0

RUN apk add grafana telegraf supervisor --no-cache

RUN mkdir -p /var/lib/grafana/dashboards
COPY ./start.sh /tmp/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./grafana.db /usr/share/grafana/data/
COPY ./telegraf.conf /etc/telegraf.conf
#COPY ./grafana.ini /etc/
COPY ./dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/
COPY ./grafic.json /usr/share/grafana/conf/provisioning/dashboards
RUN chmod +x /tmp/start.sh

EXPOSE 3000
CMD ["/tmp/start.sh"]
