
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

sed -i "s|WP_DB_NAME|'$DB_NAME'|g" /var/www/wordpress/wp-config.php
sed -i "s|WP_DB_USER|'$DB_USER'|g" /var/www/wordpress/wp-config.php
sed -i "s|WP_DB_PASSWORD|'$DB_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i "s|WP_DB_HOST|'$WP_DB_HOST'|g" /var/www/wordpress/wp-config.php


/usr/sbin/php-fpm7.3 -F