FROM alpine:latest

WORKDIR /app

COPY requirements/mariadb/cnf/my.cnf /etc/

COPY requirements/mariadb/docker-entrypoint.sh .

RUN apk -U upgrade && \
    apk add --no-cache mariadb mariadb-client && \
    rm -f /var/cache/apk/*

EXPOSE 3306

CMD [ "/app/docker-entrypoint.sh" ]