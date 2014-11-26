#!/bin/bash
cd /var/www/diaspora/
cp ./docker/diaspora.yml config/
cp ./docker/database.yml config/
source /home/diaspora/.bashrc
bundle install
bundle exec rake db:create db:schema:load
