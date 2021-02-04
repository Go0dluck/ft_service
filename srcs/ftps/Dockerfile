FROM alpine:3.13.0

RUN apk add openssl telegraf supervisor vsftpd --no-cache

RUN openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/CN=ksharee" -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt
COPY ./start.sh /tmp/
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./vsftpd.conf /etc/vsftpd.conf
RUN chmod +x /tmp/start.sh
COPY ./telegraf.conf /etc/telegraf.conf
RUN adduser -D admin
RUN echo "admin:admin"|chpasswd

EXPOSE 21000 21
CMD ["/tmp/start.sh"]
