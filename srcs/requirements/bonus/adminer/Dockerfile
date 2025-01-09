FROM alpine:3.20

WORKDIR /app

RUN apk update && \
	apk add --no-cache \
	curl \
	php82 \
	php82-mysqli \
	php82-session \
	dumb-init

EXPOSE 80

RUN curl -L -o /app/index.php "https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php" 

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "php82" , "-S", "0.0.0.0:80"]