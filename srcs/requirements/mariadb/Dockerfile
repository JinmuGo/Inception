FROM alpine:3.20

WORKDIR /app

COPY ./conf/my.cnf /etc/

COPY ./tools/docker-entrypoint.sh .

RUN apk -U upgrade && \
    apk add --no-cache \
    mariadb \
    mariadb-client \
    dumb-init

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD [ "/app/docker-entrypoint.sh" ]