FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade

RUN		apk add nginx openssl supervisor
RUN		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache
RUN		mkdir -p /run/nginx

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/nginx.conf				/etc/nginx/conf.d/default.conf
COPY	/srcs/supervisord.conf	/etc/supervisord.conf
COPY	/srcs/nginx.html 				/var/www
COPY	/srcs/start.sh					.
RUN		chmod +x start.sh
RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=dmarget/CN=localhost"

EXPOSE	80 443 22

CMD		sh start.sh
