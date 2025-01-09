FROM alpine:3.20

WORKDIR /var/www/html

RUN apk -U upgrade && \
    apk update && \
    apk add --no-cache \
    bash \
    curl \
    php82 \
    php82-fpm \
    php82-mysqli \
    php82-cli \
    php82-phar \
    php82-mbstring \
    php82-iconv \
    php82-tokenizer \
    mariadb-client

RUN adduser -u 82 -DSG www-data www-data
    
RUN mkdir -p /var/www/html; \
	chown -R www-data:www-data /var/www/html

RUN curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php82/php-fpm.d

RUN ln -s /usr/bin/php82 /usr/bin/php

EXPOSE 9000

COPY ./tools/docker-entrypoint.sh /app/

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
