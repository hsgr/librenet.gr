source /home/diaspora/.bashrc
cp ./docker/diaspora.yml config/
cp ./docker/database.yml config/
bundle install
bundle exec rake db:create db:schema:load
