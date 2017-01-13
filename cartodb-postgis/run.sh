#!/bin/sh
set -e

# Perform all actions as user 'postgres'
export PGUSER=postgres
export POSTGRES_DB=template_postgis
# Add carto functions to the database template
createdb -T template0 -O $PGUSER -E UTF8 $POSTGRES_DB
createlang plpgsql -d $POSTGRES_DB
psql -U postgres -d $POSTGRES_DB <<EOSQL
CREATE EXTENSION postgis;
CREATE EXTENSION pgrouting;
CREATE EXTENSION cartodb CASCADE;
EOSQL
