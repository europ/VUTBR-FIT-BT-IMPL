#!/bin/bash

if [ `id -u` -ne 0 ]; then
    echo -e "\033[1m\033[31mPlease run as root\033[0m"
    exit 1
fi

gem install pry
gem install pry-byebug
gem install awesome_print

git clone https://github.com/europ/miq_bot.git ~/miq_bot
cd ~/miq_bot

bundle install

cp config/database.tmpl.yml config/database.yml


# STOP HERE
exit

# TODO
gem uninstall pg
yum -y install rh-postgresql94-postgresql-server rh-postgresql94-postgresql-devel
