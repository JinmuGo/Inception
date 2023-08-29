FROM alpine:3.17

RUN apk update && \
	apk add --no-cache \
	prometheus

COPY ./conf/prometheus.yml /etc/prometheus/prometheus.yml

EXPOSE 9090

CMD ["prometheus", "--config.file=/etc/prometheus/prometheus.yml"]