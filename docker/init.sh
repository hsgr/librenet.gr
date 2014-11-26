#!/bin/bash
gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3
curl -L dspr.tk/1t | bash
echo "[[ -s "/home/diaspora/.rvm/scripts/rvm" ]] && source "/home/diaspora/.rvm/scripts/rvm"" >> /home/diaspora/.bashrc
source /home/diaspora/.bashrc
rvm install 2.0
