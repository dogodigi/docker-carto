#!/bin/sh

# Add required extension to the database template
createdb -T template0 -O $PGUSER -E UTF8 $DB_TEMPLATE
createlang plpgsql -d $DB_TEMPLATE
psql -U postgres -d $DB_TEMPLATE <<EOSQL
CREATE EXTENSION postgis;
CREATE EXTENSION pgrouting;
CREATE EXTENSION cartodb CASCADE;
EOSQL
echo
echo 'Carto database complete; ready for start up.'
echo
