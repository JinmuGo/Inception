FROM alpine:3.17

WORKDIR /app

COPY ./requirements/mariadb/cnf/my.cnf /etc/

COPY ./requirements/mariadb/docker-entrypoint.sh .

RUN apk -U upgrade && \
    apk add --no-cache \
    mariadb \
    mariadb-client \
    dumb-init && \
    rm -f /var/cache/apk/*

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "/app/docker-entrypoint.sh" ]