#!/bin/sh

mariadb-install-db -u root
mysqld -u root & sleep 5
s
mysql -u root -e "CREATE DATABASE wpDB;"

mysql -u root wpDB < wpDB.sql
mysql -u root -e "CREATE USER 'root'@'%' IDENTIFIED BY 'root';"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; USE wordpress;"
mysql -u root -e "FLUSH PRIVILEGES"

/usr/bin/supervisord -c /etc/supervisord.conf
