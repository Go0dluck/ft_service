#!/bin/sh
mysql_install_db --user=root --datadir=/var/lib/mysql
# mysqld --user=root --bootstrap < /tmp/create.sql
# mysqld --user=root --bootstrap < /tmp/wordpress1.sql
if [ ! -f /var/lib/mysql/wordpress ]; then
	mysqld --bootstrap < /tmp/create.sql
fi
#mysqld -u root < /tmp/wordpress.sql
/usr/bin/supervisord -c /etc/supervisord.conf
