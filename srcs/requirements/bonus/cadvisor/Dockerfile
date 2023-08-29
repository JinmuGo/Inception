FROM alpine:3.17

RUN apk update && apk add libc6-compat wget
RUN mkdir -p /usr/local/bin \
    && wget -O /usr/local/bin/cadvisor https://github.com/google/cadvisor/releases/download/v0.47.2/cadvisor-v0.47.2-linux-amd64 \
    && chmod +x /usr/local/bin/cadvisor

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/cadvisor", "--logtostderr"]