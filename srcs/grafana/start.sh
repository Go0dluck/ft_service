#!/bin/sh
cd /usr/share/grafana
/usr/bin/supervisord -c /etc/supervisord.conf
