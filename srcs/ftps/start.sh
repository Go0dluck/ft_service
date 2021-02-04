#!/bin/sh
telegraf --config /etc/telegraf.conf & vsftpd && pkill telegraf
#/usr/bin/supervisord -c /etc/supervisord.conf
