#!/bin/sh

/etc/init.d/telegraf start
/usr/sbin/influxd -config /etc/influxdb.conf
/usr/bin/supervisord -c /etc/supervisord.conf
