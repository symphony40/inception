#!/bin/bash
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=$DOMAIN_NAME --title=inception --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=admin@admin.com --allow-root
./wp-cli.phar user create $WP_ADMIN_USR main@admin.com --role=admin --user_pass=$WP_ADMIN_PWD --allow-root
./wp-cli.phar user create $WP_USR admin2@admin.com --role=author --user_pass=$WP_PWD --allow-root

php-fpm8.2 -F
