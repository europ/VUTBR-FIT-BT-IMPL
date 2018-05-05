## Brno University of Technology - Faculty of Information Technology<br>Bachelor's Thesis - Implementation<br>2017/2018

### Requirements

**Bot is customized to MY account credentials!**

To change it on yours, please see the [*Customization*](https://github.com/europ/VUTBR-FIT-BT-IMPL#customization) section.

#### Credentials

- [GitHub personal access token](https://github.com/settings/tokens)
    - full access if possible to avoid unsolicited access problems
- Github organization
    - to be a member
- Organization's repository
    - the bot is set to check this repository (pull requests / builds / etc.)
- Your own forked repository from the organization's repository
    - to create a pull request which will be inspected by the bot (bot reacts to the PR's comments)
- [Gitter personal access token](https://developer.gitter.im/apps)
- Gitter room

#### Customization

Rewrite my informations by yours in:
- initializing script `miqbot_init.sh`
    - occurrence of `xtest123/testrepo` to yours `organization/repository`
- resetting script `miqbot_reset.sh`
    - occurrence of `xtest123/testrepo` to yours `organization/repository`
- configuration file `~/miq_bot/config/settings/development.local.yml`
    - github_credentials -> username
    - github_credentials -> password
    - occurrence of `xtest123/testrepo` to yours `organization/repository`

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
    - `cd ~/miq_bot`
    - Start the bot (`git checkout master` - to check that everything works correctly):
        - Start all Sidekiq workers together
            - `bundle exec foreman start`
        - Start Sidekiq workers separately (open 3 shells)
            - `bundle exec rails s -b 0.0.0.0 -p 3000`
            - `bundle exec sidekiq -q miq_bot`
            - `bundle exec sidekiq -q miq_bot_glacial`

### Pull Requests

To check the pull request functionality you have to `git checkout` the pertaining branch of the pull request which can be found in the footnotes of the [thesis](https://github.com/europ/VUTBR-FIT-BT/blob/master/PDF/thesis.pdf).

### ManageIQ Bot

The original setup of the [ManageIQ bot](https://github.com/ManageIQ/miq_bot) can be found [here](https://github.com/ManageIQ/miq_bot#development).

### Bachelor's Thesis

Bachelor's Thesis is available [here](https://github.com/europ/VUTBR-FIT-BT).
