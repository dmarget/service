FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade

RUN		apk add mariadb mariadb-client supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		mkdir -p /run/mysqld/

COPY	/srcs/supervisord.conf		/etc/supervisord.conf
COPY 	/srcs/telegraf.conf		    /etc/telegraf/
COPY	/srcs/my.cnf				      /etc/
COPY	/srcs/wpDB.sql		        /
COPY	/srcs/mysql.sh				    /

EXPOSE	3306

VOLUME	["var/lib/mysql"]

CMD	sh mysql.sh
