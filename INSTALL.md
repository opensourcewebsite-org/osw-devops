# Installation

Please read through our [Contributing Guidelines](CONTRIBUTING.md).

## General setup

- Run `sudo wget -L https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/install.sh` to download install script
- Run `sudo sh install.sh` to install initial environment
- Put user password's hash in '/srv/users-passwords.txt'
- Run `sudo salt '*' state.apply --state-verbose=false`
