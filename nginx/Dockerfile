FROM debian:buster

RUN apt-get update \
    && apt-get upgrade \
    && apt-get install -y nginx openssl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

RUN mkdir -p /etc/ssl
RUN chown -R www-data:www-data /etc/ssl
RUN chown -R www-data:www-data /var/www/*
RUN chmod 744 /var/www/*

RUN openssl req -x509 -nodes -days 365 -subj "/C=KR/ST=Belgium/L=Brussels/O=19school/OU=19bx/CN=dbanzizi" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;


COPY ./sites/nginx.conf /etc/nginx/sites-available
RUN  ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled && rm /etc/nginx/sites-enabled/default

EXPOSE 80

CMD ["nginx"]
