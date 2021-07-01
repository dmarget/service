FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade

RUN		echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk add influxdb libc6-compat
RUN		apk add openrc supervisor
RUN		apk add telegraf
RUN		openrc
RUN		touch /run/openrc/softlevel

COPY	/srcs/supervisord.conf		/etc/supervisord.conf
COPY	/srcs/telegraf.conf /etc/
COPY	/srcs/start.sh      /

VOLUME	["/var/lib/influxdb"]

EXPOSE	8086

CMD  sh start.sh
