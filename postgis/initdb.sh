#!/bin/bash
set -e

directory=/tmp/dumps

db="$DB_NAME"

psql -U "$DB_USER" -c "CREATE DATABASE $db;"
psql -U "$DB_USER" -d "$db" -c "CREATE EXTENSION postgis;"

for file in "$directory"/*.sql; do
    psql -U "$DB_USER" -d "$db" -f "$file"
done

rm -r $directory
