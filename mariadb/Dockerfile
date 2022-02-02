FROM debian:buster

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install mariadb-server -y
COPY ./src/init.sh /init.sh

RUN chmod 777 /init.sh

EXPOSE 3306
COPY ./src/my.cnf /etc/mysql/mariadb.conf.d/

COPY /src/init.sh .

CMD ["/bin/bash", "init.sh"]

