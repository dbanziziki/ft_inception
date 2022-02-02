FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install php7.3 php7.3-fpm wget -y
RUN apt-get install php-json php-xmlrpc php-curl php-gd php-xml php-mysql php-mbstring -y

RUN wget https://wordpress.org/latest.tar.gz && \
    tar -xzvf latest.tar.gz

RUN mkdir -p /var/www

RUN mv ./wordpress /var/www

COPY ./src/wp-config.php /var/www/wordpress

COPY ./src/index.php /var/www

RUN chown -R www-data:www-data /var/www/*
RUN chmod 744 /var/www/*


COPY ./src/*sh ./

EXPOSE 9000

RUN sh /etc/init.d/php7.3-fpm start


CMD [ "/bin/bash", "init.sh"]
