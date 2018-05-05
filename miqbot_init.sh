#!/bin/bash

if [ `id -u` -ne 0 ]; then
    echo -e "\033[1m\033[31mPlease run as root\033[0m"
    exit 1
fi

CWD=`pwd`

gem install pry
gem install pry-byebug
gem install awesome_print

git clone https://github.com/europ/miq_bot.git ~/miq_bot

cd ~/miq_bot
git checkout master

bundle install

# REDIS
yum install -y redis # Prerequisites => execution of install.sh (yum install epel-release && yum update)
systemctl start redis
systemctl enable redis
echo -e "\033[32mRedis PING\033[0m"
redis-cli ping

# PSQL
cp config/database.tmpl.yml config/database.yml
sed -i "s/username:.*/username: miqbot/g" config/database.yml
sed -i "s/password:.*/password: miqbot/g" config/database.yml
postgresql-setup initdb
grep -q '^local\s' /var/lib/pgsql/data/pg_hba.conf || echo "local all all trust" | sudo tee -a /var/lib/pgsql/data/pg_hba.conf
sed -i.bak 's/\(^local\s*\w*\s*\w*\s*\)\(peer$\)/\1trust/' /var/lib/pgsql/data/pg_hba.conf
systemctl enable postgresql
systemctl start postgresql
sudo -u postgres psql -c "CREATE ROLE miqbot SUPERUSER LOGIN PASSWORD 'miqbot'"
sed -i "s/^\(local\s*all\s*all\s*\)trust$/\1md5/g" /var/lib/pgsql/data/pg_hba.conf
sed -i "s/^\(host\s*all\s*all\s*.*\s*\)ident$/\1md5/g" /var/lib/pgsql/data/pg_hba.conf
systemctl restart postgresql.service
bundle exec rake db:setup

echo -e "\033[32mPostgreSQL done.\033[0m"

bundle exec rails runner 'Repo.create_from_github!("xtest123/testrepo", "https://github.com/xtest123/testrepo.git")'
cp Procfile.tmpl Procfile
cp $CWD/settings.yml ~/miq_bot/config/settings/development.local.yml

echo -e "\033[1m\033[32mSUCCESS\033[0m"
exit 0
