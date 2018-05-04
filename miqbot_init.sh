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
sed -i "s/username:.*/username: miqbot/g" config/database.yml
sed -i "s/password:.*/password: miqbot/g" config/database.yml

#### STOP HERE

echo -e "\033[1m\033[31mSTOPPED BEFORE PSQL SECTION\033[0m"
exit 1

#TODO

sudo -u postgres psql -c "CREATE ROLE miqbot SUPERUSER LOGIN PASSWORD 'miqbot'"

bundle exec rake db:setup

echo -e "\033[1m\033[32mSUCCESS\033[0m"
exit 0
