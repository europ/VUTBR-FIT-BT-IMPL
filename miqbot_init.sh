#!/bin/bash

git clone https://github.com/europ/miq_bot.git ~/miq_bot
cd ~/miq_bot

git checkout VUTBR-FIT-BT-IMPL

bundle install

# Continue if the bundle install succeed
