#!/bin/bash

if [ `id -u` -ne 0 ]; then
    echo -e "\033[1m\033[31mPlease run as root\033[0m"
    exit 1
fi

yum group install -y "Development Tools"

yum install -y \
    centos-release-scl git-core zlib zlib-devel gcc-c++ patch readline libyaml-devel cmake   \
    openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel python-devel  \
    postgresql-devel postgresql-libs postgresql-server memcached readline-devel libffi-devel \
    vim

systemctl enable memcached
systemctl start memcached

curl "https://bootstrap.pypa.io/get-pip.py" | python
pip install yamllint

echo -e "\033[1m\033[32mSUCCESS\033[0m"
