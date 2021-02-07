FROM alpine:3.13.0

RUN apk add nginx supervisor telegraf --no-cache
RUN apk add php7-common php7-fpm php7-opcache php7-gd php-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session php7-phar php7-cli php7-zip php7-iconv php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom
RUN mkdir -p /run/nginx
RUN adduser -D -g 'www' www && \
	mkdir /www && \
	mkdir -p /run/nginx && \
	chown -R www:www /var/lib/nginx && \
	chown -R www:www /www

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./supervisord.conf /etc/supervisord.conf
COPY ./telegraf.conf /etc/telegraf.conf
COPY ./start.sh /tmp/
RUN chmod +x /tmp/start.sh

COPY ./wordpress-5.6.1-ru_RU.tar.gz .
RUN tar -xvzf wordpress-5.6.1-ru_RU.tar.gz && rm -f wordpress-5.6.1-ru_RU.tar.gz
RUN mv wordpress /www/wordpress
COPY ./wp-config.php /www/wordpress

#EXPOSE 5050
CMD ["/tmp/start.sh"]
