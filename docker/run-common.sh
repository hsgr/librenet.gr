#!/bin/bash
useradd diaspora
chmod 755 /home/diaspora
chown -R diaspora:diaspora /app
su - diaspora

gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L dspr.tk/1t | bash
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
#echo "[[ -s "/home/diaspora/.rvm/scripts/rvm" ]] && source "/home/diaspora/.rvm/scripts/rvm"" >> /home/diaspora/.bashrc
source /home/diaspora/.bashrc
cd /app
rvm install 2.0
cp ./bin/diaspora.yml config/
cp ./bin/database.yml config/
DB=mysql bundle install
DB=mysql bundle exec rake db:create db:schema:load
