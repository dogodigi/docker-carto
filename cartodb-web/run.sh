#!/bin/sh
set -e


export PATH=$PATH:$PWD/node_modules/grunt-cli/bin
npm cache clean && npm install -g n && n 0.10 && npm update -g npm@^2
node -v && npm -v
bundle exec grunt --environment $RAILS_ENV
cp config/app_config.yml.sample config/app_config.yml
cp config/database.yml.sample config/database.yml
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rails server && bundle exec ./script/resque
