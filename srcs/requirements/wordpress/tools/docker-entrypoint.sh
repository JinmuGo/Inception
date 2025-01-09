#!/bin/sh

sleep 20

wp core download --path=/var/www/html

wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MARIADB_USER --dbpass=$MARIADB_PASSWORD --dbhost=mariadb

wp core install  --url=$WP_DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_USER@$WP_ADMIN_USER.42.fr
wp user create $WP_NORM_USER $WP_NORM_USER@42.fr --role=author --user_pass=$WP_NORM_PASSWORD

wp plugin install redis-cache --activate
wp config set WP_REDIS_HOST redis
wp config set WP_REDIS_PORT 6379
wp config set WP_CACHE true

# wp redis enable  # for bonus

exec php-fpm82 -F -R