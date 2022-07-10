# Installation

Please read through our [Contributing Guidelines](CONTRIBUTING.md).

## General server setup

- Run `sudo wget -L https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/install.sh` to download install script.
- Run `sudo sh install.sh` to install initial environment.
- Put user password's hash in '/srv/users-passwords.txt'.
- Run `sudo salt '*' state.apply --state-verbose=false`.
- Check email sending: `bash mail-testert.sh user@domain.tld`.

### Add/Remove admin users

- Edit file [`users.yml`](pillar/users/users.yml).
- Add variables with user data (USERNAME: SSH PUBLIC KEY).
