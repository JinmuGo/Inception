#!/bin/sh

mkdir -p /run/mysqld/ \
&& chown -R mysql:mysql /run/mysqld/ \
&& chmod 777 /run/mysqld/

echo "install db\n"

mysql_install_db --user=mysql

mariadbd --user=mysql &

sleep 10

sqlRoot="createRoot.sql"

cat << delim > $sqlRoot  #  mysql 사용자가 만듦.
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
delim

sqlNewDatabase="createDatabase.sql"

cat << delim > $sqlNewDatabase
CREATE DATABASE ${WORDPRESS_DB_NAME};
FLUSH PRIVILEGES;
delim

sqlNewUser="createNewUser.sql"

cat << delim > $sqlNewUser
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${WORDPRESS_DB_NAME}.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
delim

echo "create Root User\n"
mariadb --user=root < $sqlRoot
echo "create Database\n"
mariadb --user=root -p"${MARIADB_ROOT_PASSWORD}" < $sqlNewDatabase
echo "create Jgo \n"
mariadb --user=root -p"${MARIADB_ROOT_PASSWORD}" < ${sqlNewUser}

# rm -f ${sqlRoot} ${sqlNewDatabase} ${sqlNewUser}

pkill mariadbd

sleep 3

exec mariadbd --datadir='/var/lib/mysql/' --user=mysql