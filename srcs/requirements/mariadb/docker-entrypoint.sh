#!/bin/sh

mkdir -p /run/mysqld

chown -R mysql:mysql /run/mysqld/
chown -R mysql:mysql /var/lib/mysql

mysql_install_db --user=mysql > /dev/null

sqltmpfile="dbtmp.sql"
MYSQL_DATABASE=${MYSQL_DATABASE:-""}
MYSQL_USER=${MYSQL_USER:-""}
MYSQL_PASSWORD=${MYSQL_PASSWORD:-""}

cat << delim > $sqltmpfile  #  mysql 사용자가 만듦.
CREATE DATABASE wordpress_db;
CREATE USER "$MYSQL_USER"@'localhost' IDENTIFIED BY "$MYSQL_PASSWORD";
FLUSH PRIVILEGES;
delim

mysql --user=mysql < $sqltmpfile

exec mysqld --user=mysql