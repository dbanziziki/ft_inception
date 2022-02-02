#!/bin/bash

service mysql start

mysql -u root -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wordpress;"
mysql -u root -e "USE wordpress; GRANT ALL PRIVILEGES ON * TO '$DB_USER'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"

service mysql stop

mysqld_safe