
#!/bin/bash

sed -i "s|WP_DB_NAME|'$DB_NAME'|g" /var/www/wordpress/wp-config.php
sed -i "s|WP_DB_USER|'$DB_USER'|g" /var/www/wordpress/wp-config.php
sed -i "s|WP_DB_PASSWORD|'$DB_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i "s|WP_DB_HOST|'$WP_DB_HOST'|g" /var/www/wordpress/wp-config.php
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

cd /var/www/wordpress

wp core download --allow-root

wp core install --allow-root --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN\
                                --admin_password=$WP_ADMIN_PASS --admin_email=$WP_ADMIN_MAIL

wp user create --allow-root $WP_USER $WP_USER_MAIL --user_pass=$WP_USER_PASS

chown -R www-data:www-data /var/www/*
chmod 744 /var/www/*

/usr/sbin/php-fpm7.3 -F
