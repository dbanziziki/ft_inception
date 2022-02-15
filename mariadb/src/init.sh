#!/bin/sh

rc default
/etc/init.d/mariadb setup
rc-service mariadb start

sed -i "s|DB_NAME|$DB_NAME|g" setup_db.sql
sed -i "s|DB_USER|$DB_USER|g" setup_db.sql
sed -i "s|DB_PASSWORD|$DB_PASSWORD|g" setup_db.sql
sed -i "s|DB_PASSWORD|$DB_PASSWORD|g" setup_db.sql

mysql --skip-password < setup_db.sql

mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PASSWORD'; FLUSH PRIVILEGES;"

rc-service mariadb stop

/usr/bin/mysqld_safe