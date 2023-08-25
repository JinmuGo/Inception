# https://redis.io/docs/management/config/

FROM alpine:3.17

RUN addgroup -S -g 1000 redis && adduser -S -G redis -u 999 redis

WORKDIR /data

RUN apk update && \
    apk add --no-cache \
    redis

RUN mkdir -p /data && chown redis:redis /data

RUN echo "maxmemory 2mb\nmaxmemory-policy allkeys-lru" >> /etc/redis.conf

RUN sed -i -r "s/bind 127.0.0.1/#bind 127.0.0.1/" /etc/redis.conf

EXPOSE 6379

CMD [ "redis-server", "--protected-mode", "no" ]