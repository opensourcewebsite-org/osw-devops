#!/usr/bin/env bash

set -euo pipefail

UBUNTU_VERSION=$(grep -F VERSION_ID /etc/os-release | cut -d\" -f2)
UBUNTU_CODENAME=$(grep -F VERSION_CODENAME /etc/os-release | cut -d= -f2)

apt-get update
apt-get dist-upgrade -y
apt-get install wget -y

wget -qO /usr/share/keyrings/salt-archive-keyring.gpg "https://repo.saltproject.io/salt/py3/ubuntu/${UBUNTU_VERSION}/amd64/latest/salt-archive-keyring.gpg"

if [[ -f /etc/apt/sources.list.d/saltstack.list ]]; then rm -f /etc/apt/sources.list.d/saltstack.list; fi

cat <<EOF > /etc/apt/sources.list.d/salt.list
deb [signed-by=/usr/share/keyrings/salt-archive-keyring.gpg arch=amd64] https://repo.saltproject.io/salt/py3/ubuntu/${UBUNTU_VERSION}/amd64/latest ${UBUNTU_CODENAME} main
EOF

apt-get update
apt-get install salt-master salt-minion -y

cat <<EOF > /etc/salt/master
fileserver_backend:
  - git

gitfs_provider: gitpython
gitfs_update_interval: 80

gitfs_saltenv_whitelist:
  - base

gitfs_remotes:
  - https://github.com/saltstack-formulas/salt-formula.git
  - https://github.com/saltstack-formulas/cron-formula.git
  - https://github.com/saltstack-formulas/nginx-formula.git
  - https://github.com/saltstack-formulas/php-formula.git
  - https://github.com/saltstack-formulas/supervisor-formula.git
  - https://github.com/saltstack-formulas/users-formula.git
  - https://github.com/saltstack-formulas/logrotate-formula.git
  - https://github.com/opensourcewebsite-org/osw-devops.git:
    - root: salt

pillarenv_from_saltenv: True
ext_pillar:
  - git:
    - https://github.com/opensourcewebsite-org/osw-devops.git
      - root: pillar
EOF

salt-pip install GitPython

systemctl restart salt-master

echo 'opensourcewebsite.org' > /etc/salt/minion_id

if ! grep -Fq 'master: 127.0.0.1' /etc/salt/minion; then
  echo 'master: 127.0.0.1' >> /etc/salt/minion
fi

systemctl restart salt-minion

sleep 60

salt-key -a opensourcewebsite.org -y

# Swap
if ! [[ -f /swapfile ]]; then
  fallocate -l 4G /swapfile
  chmod 600 /swapfile
  mkswap /swapfile
  swapon /swapfile
  echo '/swapfile none swap sw 0 0' >> /etc/fstab
  echo 'vm.swappiness=0' > /etc/sysctl.d/10-swappiness.conf
  sysctl --system
fi

# Certifications for nginx
mkdir -p /etc/letsencrypt/live/opensourcewebsite.org
mkdir /etc/nginx
openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/letsencrypt/live/opensourcewebsite.org/privkey.pem -out /etc/letsencrypt/live/opensourcewebsite.org/fullchain.pem
openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx.pem -out /etc/nginx/nginx.pem

# Copy a file with user-passwords
wget https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/pillar/users/user-passwords.txt.dist -O /srv/user-passwords.txt

# Copy email test script
wget https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/mail-testert.sh
