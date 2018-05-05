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

postgresql-setup initdb
grep -q '^local\s' /var/lib/pgsql/data/pg_hba.conf || echo "local all all trust" | sudo tee -a /var/lib/pgsql/data/pg_hba.conf
sed -i.bak 's/\(^local\s*\w*\s*\w*\s*\)\(peer$\)/\1trust/' /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
systemctl start postgresql
sudo -u postgres psql -c "CREATE ROLE miqbot SUPERUSER LOGIN PASSWORD 'miqbot'"
sed -i "s/^local\s*all\s*all\s*ident$/local all all md5/g" /var/lib/pgsql/data/pg_hba.conf
systemctl restart postgresql.service

bundle exec rake db:setup

echo -e "\033[1m\033[32mSUCCESS\033[0m"
exit 0
