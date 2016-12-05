#!/bin/bash
cd /windshaft-cartodb

sed -i "s/__DB_PORT__/$DB_PORT/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example
sed -i "s/__DB_HOST__/$DB_HOST/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example
sed -i "s/__DB_USER__/$DB_USER/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example
sed -i "s/__REDIS_HOST__/$REDIS_HOST/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example
sed -i "s/__REDIS_PORT__/$REDIS_PORT/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example
sed -i "s/__WINDSHAFT_PORT__/$WINDSHAFT_PORT/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example
sed -i "s/__CORS_ENABLED__/$CORS_ENABLED/g" /windshaft-cartodb/config/environment/$CARTO_ENV.js.example

./configure --environment=$CARTO_ENV --with-pgport=$DB_PORT
node app.js $CARTO_ENV
