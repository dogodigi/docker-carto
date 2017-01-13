#!/bin/sh
set -e

export PATH=$PATH:$PWD/node_modules/grunt-cli/bin
rm config/*.sample
mv config/grunt_docker.json grunt_$CARTO_ENV.json
sed -i "s/__DB_HOST__/$DB_HOST/g" config/database.yml
sed -i "s/__DB_PORT__/$DB_PORT/g" config/database.yml
sed -i "s/__DB_USER__/$DB_USER/g" config/database.yml

sed -i "s/__CARTO_SESSION_DOMAIN__/$CARTO_SESSION_DOMAIN/g" config/app_config.yml
sed -i "s/__CARTO_SESSION_PORT__/$CARTO_SESSION_PORT/g" config/app_config.yml
sed -i "s/__REDIS_HOST__/$REDIS_HOST/g" config/app_config.yml
sed -i "s/__REDIS_PORT__/$REDIS_PORT/g" config/app_config.yml
sed -i "s/__MAP_API_HOST__/$MAP_API_HOST/g" config/app_config.yml
sed -i "s/__SQL_API_PORT__/$SQL_API_PORT/g" config/app_config.yml
sed -i "s/__SQL_API_HOST__/$SQL_API_HOST/g" config/app_config.yml
sed -i "s/__SQL_API_PORT__/$SQL_API_PORT/g" config/app_config.yml
node -v && npm -v
bundle exec grunt --environment $CARTO_ENV
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails server && bundle exec ./script/resque
