#!/bin/bash

if [ `id -u` -ne 0 ]; then
    echo "Please run root"
    exit 1
fi

yum group install -y "Development Tools"

sudo yum install -y \
    git-core zlib zlib-devel gcc-c++ patch readline readline-devel libyaml-devel libffi-devel \
    openssl-devel make bzip2 autoconf automake libtool bison curl sqlite-devel vim
