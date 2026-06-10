#!/bin/bash
set -e

psql -U "$DB_USER" -c "CREATE DATABASE $DB_NAME;"
psql -U "$DB_USER" -d "$DB_NAME" -c "CREATE EXTENSION postgis;"

ogr2ogr -f PGDump /vsistdout/ /tmp/data/districts.json \
  -nln districts \
  -lco GEOMETRY_NAME=geometry \
  -lco FID=id \
  | psql -U "$DB_USER" -d "$DB_NAME"

ogr2ogr -f PGDump /vsistdout/ /tmp/data/locations.json \
  -nln locations \
  -lco GEOMETRY_NAME=geometry \
  -lco FID=id \
  | psql -U "$DB_USER" -d "$DB_NAME"
