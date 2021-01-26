FROM alpine:3.7

RUN apk add nginx openssl --no-cache
COPY ./nginx-localhost /etc/nginx/conf.d/default.conf

RUN openssl req -new -newkey rsa:2048 -nodes -days 365 -x509 -subj "/CN=ksharee" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt

COPY ./start.sh /tmp/
RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443
CMD ["/tmp/start.sh"]