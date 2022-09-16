# Installation

Please read through our [Contributing Guidelines](CONTRIBUTING.md).

## General server setup

- Run `wget https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/install.sh` to download install script.
- Run `sudo bash install.sh` to install initial environment.
- Put user password's hash in `/srv/users-passwords.txt`.
- Run `sudo salt '*' state.apply --state-verbose=false`.
- Replace `<SetYourAPIKey>` to your own [SendGrid API key](https://app.sendgrid.com/settings/api_keys) in `/etc/exim4/passwd.client` and run `systemctl restart exim4`
- Check email sending, run `bash mail-testert.sh user@domain.tld`.

### Add/Remove admin users

- Edit file [`users.yml`](pillar/users/users.yml).
- Add variables with user data (USERNAME: SSH PUBLIC KEY).
