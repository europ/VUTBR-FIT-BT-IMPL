## Brno University of Technology - Faculty of Information Technology<br>Bachelor's Thesis - Implementation<br>2017/2018

### Setup

1. Download and install [Oracle VM VirtualBox](https://www.virtualbox.org/)
2. Download [CentOS 7](https://www.centos.org/)
    - [CentOS-7-x86_64-Minimal-1708.iso](http://isoredirect.centos.org/centos/7/isos/x86_64/CentOS-7-x86_64-Minimal-1708.iso)
3. [Set up the virtual machine](https://github.com/europ/VUTBR-FIT-BT-IMPL/blob/master/VM_SETUP.md)
4. Execute the following commands in the following order from top to bottom:
    - `cd /root`
    - `yum install -y git`
    - `git clone https://github.com/europ/VUTBR-FIT-BT-IMPL.git`
    - `cd VUTBR-FIT-BT-IMPL`
    - `./install.sh`
    - `./rbenv.sh`
    - `./miqbot_init.sh`
    - Start the bot (`git checkout master` - to check that everything works correctly):
        - Start all Sidekiq workers (`cd ~/miq_bot`)
            - `bundle exec foreman start`
        - Start Sidekiq workers separately (open 3 shells and `cd ~/miq_bot`)
            - `bundle exec rails s -b 0.0.0.0 -p 3000`
            - `bundle exec sidekiq -q miq_bot`
            - `bundle exec sidekiq -q miq_bot_glacial`

TODO: token => github + gitter

To check the pull request features you have to find the pertaining branch of the pull request and git checkout on it.
