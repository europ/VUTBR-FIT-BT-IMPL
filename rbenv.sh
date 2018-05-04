#!/bin/bash

if [ `id -u` -ne 0 ]; then
    echo -e "\033[1m\033[31mPlease run as root\033[0m"
    exit 1
fi

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

echo 'export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

source ~/.bash_profile

rbenv install -v 2.3.6
rbenv global 2.3.6

gem install bundler

rbenv rehash

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash

echo -e "\033[1m\033[32mSUCCESS\033[0m"
