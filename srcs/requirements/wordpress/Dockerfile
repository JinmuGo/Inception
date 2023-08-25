FROM alpine:3.17

WORKDIR /var/www/html

RUN apk -U upgrade && \
    apk update && \
    apk add --no-cache \
    bash \
    curl \
    php81 \
    php81-fpm \
    php81-mysqli \
    php81-cli \
    php81-phar \
    php81-mbstring \
    php81-iconv \
    php81-tokenizer \
    mariadb-client

RUN adduser -u 82 -DSG www-data www-data
    
RUN mkdir -p /var/www/html; \
	chown -R www-data:www-data /var/www/html

RUN curl -O "https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar" && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php81/php-fpm.d

EXPOSE 9000

COPY ./tools/docker-entrypoint.sh /app/

ENTRYPOINT [ "/app/docker-entrypoint.sh" ]
