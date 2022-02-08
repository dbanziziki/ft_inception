FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install php7.3 php7.3-fpm wget -y
RUN apt-get install php-json php-xmlrpc php-curl php-gd less sudo curl php-xml php-mysql php-mbstring -y

RUN     wget -P /usr/local/bin https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN     chmod -R 777 /usr/local/bin/wp-cli.phar
RUN     mv /usr/local/bin/wp-cli.phar /usr/local/bin/wp

RUN     mkdir -p /var/www/wordpress

COPY ./src/wp-config.php /var/www/wordpress

RUN     chmod g+w /var/www/wordpress/wp-config.php

COPY ./src/*sh ./

EXPOSE 9000

RUN sh /etc/init.d/php7.3-fpm start


CMD [ "/bin/bash", "init.sh"]
