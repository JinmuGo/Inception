FROM alpine:3.17

RUN apk update && \
    apk add --no-cache \
    nginx \
    openssl

RUN openssl req -x509 -nodes -days 365 \
    -subj "/C=KR/L=Seoul/O=42Seoul/CN=jgo.42.fr" \
    -addext "subjectAltName=DNS:jgo.42.fr" \
    -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx-selfsigned.key \
    -out /etc/ssl/certs/nginx-selfsigned.crt;

COPY ./conf/default.conf /etc/nginx/http.d/

EXPOSE 443

CMD [ "nginx", "-g", "daemon off;" ]