# Base 이미지로 Alpine Linux 사용
FROM alpine:3.17

ARG GRA_USER \
    GRA_PASSWORD

RUN apk update && apk add --no-cache grafana

COPY ./conf/cadvisorDashBoard.json /usr/share/grafana/public/dashboards/home.json

RUN  sed -i -r "s/disable_initial_admin_creation = false/disable_initial_admin_creation = true/" /usr/share/grafana/conf/defaults.ini && \
    sed -i -r "s/admin_user = admin/admin_user = $GRA_USER/" /usr/share/grafana/conf/defaults.ini && \
    sed -i -r "s/admin_password = admin/admin_password = $GRA_PASSWORD/" /usr/share/grafana/conf/defaults.ini && \
    sed -i -r "s/admin_email= admin@localhost/admin_email= $GRA_USER@localhost/" /usr/share/grafana/conf/defaults.ini && \
    sed -i -r "s/http_port = 3000/http_port = 4242/" /usr/share/grafana/conf/defaults.ini

RUN grafana-cli plugins install camptocamp-prometheus-alertmanager-datasource

WORKDIR /usr/share/grafana/

EXPOSE 4242

CMD ["grafana-server", "--config=/usr/share/grafana/conf/defaults.ini", "--homepath=/usr/share/grafana"]