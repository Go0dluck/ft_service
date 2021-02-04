FROM alpine:3.13.0

RUN apk add nginx openssl openssh supervisor telegraf --no-cache
COPY ./nginx-localhost /etc/nginx/conf.d/default.conf

RUN openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/CN=ksharee" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt

RUN ssh-keygen -A
RUN adduser -D admin
RUN echo "admin:admin"|chpasswd

COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf.conf
COPY ./start.sh /tmp/

RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443 22
CMD ["/tmp/start.sh"]
