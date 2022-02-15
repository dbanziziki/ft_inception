FROM alpine:3.14

VOLUME ["/sys/fs/cgroup"]

RUN apk update && apk upgrade

RUN apk add mariadb mariadb-common mariadb-client openrc

COPY ./src/setup_db.sql ./

COPY ./src/init.sh ./

COPY ./src/my.cnf /etc/

CMD ["/bin/sh", "init.sh"]
