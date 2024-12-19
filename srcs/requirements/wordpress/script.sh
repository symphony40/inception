#!/bin/bash
ROOT_ENV_FILE="$(dirname "$0")/../../.env"

# Load environment variables from .env file
if [ -f "$ROOT_ENV_FILE" ]; then
    set -o allexport
    source "$ROOT_ENV_FILE"
    set +o allexport
else
    echo "Root .env file not found at $ROOT_ENV_FILE!"
    exit 1
fi
cd /var/www/html
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
./wp-cli.phar core download --allow-root
./wp-cli.phar config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root
./wp-cli.phar core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

php-fpm8.2 -F
