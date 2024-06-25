#!/bin/bash

set -e
set -u

function create_user_and_database() {
	local database=$1
	echo "  Creating user and database '$database'"
	mysql -v -u "root" -p"example" <<-EOSQL
      CREATE DATABASE IF NOT EXISTS $database;
      CREATE USER IF NOT EXISTS 'dbuser'@'%' IDENTIFIED BY 'dbpasswd';
      GRANT ALL PRIVILEGES ON *.* TO 'dbuser'@'%';
EOSQL
}

if [ -n "$MYSQL_MULTIPLE_DATABASES" ]; then
	echo "Multiple database creation requested: $MYSQL_MULTIPLE_DATABASES"
	for db in $(echo $MYSQL_MULTIPLE_DATABASES | tr ',' ' '); do
		create_user_and_database $db
    
	done
	echo "Multiple databases created"
fi
