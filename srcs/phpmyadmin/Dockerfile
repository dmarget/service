FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session && \
			apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
			wget https://files.phpmyadmin.net/phpMyAdmin/4.9.2/phpMyAdmin-4.9.2-all-languages.tar.gz && \
			tar -xzvf phpMyAdmin-4.9.2-all-languages.tar.gz && \
			rm -rf phpMyAdmin-4.9.2-all-languages.tar.gz && \
			mkdir -p /www /etc/telegraf && mv phpMyAdmin-4.9.2-all-languages /www/phpmyadmin

RUN 	apk add nginx supervisor openssl

COPY	/srcs/telegraf.conf				/etc/telegraf/
COPY	/srcs/supervisord.conf		/etc/supervisord.conf
COPY	/srcs/config.inc.php			/www/phpmyadmin/
COPY	/srcs/nginx.conf 				  /etc/nginx/conf.d/default.conf
RUN		mkdir -p /run/nginx
COPY	/srcs/start.sh					  /

RUN		openssl req -x509 -nodes -days 365 \
		-newkey rsa:2048 \
		-keyout /etc/ssl/private/nginx.key \
		-out /etc/ssl/certs/nginx.crt  -subj "/C=RU/ST=Kazan/L=Kazan/O=21/OU=dmarget/CN=localhost"

EXPOSE	5000

CMD		sh start.sh
