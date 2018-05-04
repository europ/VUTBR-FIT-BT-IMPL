#!/bin/bash

cd ~/miq_bot
bin/rake db:drop db:create db:migrate db:seed
rm -rf repos/*
redis-cli FLUSHALL && redis-cli FLUSHDB
bundle exec rails runner 'Repo.create_from_github!("xtest123/testrepo", "https://github.com/xtest123/testrepo.git")'
bin/rake db:migrate RAILS_ENV=test

echo -e "\033[1m\033[32mSUCCESS\033[0m"
exit 0
