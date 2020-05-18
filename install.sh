#!/bin/bash
apt-get update -y
apt-get upgrade -y
wget -O - https://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest/SALTSTACK-GPG-KEY.pub | sudo apt-key add -
cat <<EOF > /etc/apt/sources.list.d/saltstack.list
deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main
EOF
apt-get update -y
apt-get install salt-master -y
apt-get install salt-minion -y
cat <<EOF > /etc/salt/master
file_roots:
  base:
    - /srv/salt
    - /srv/formulas
    - /srv/formulas/salt-formula
    - /srv/formulas/cron-formula
    - /srv/formulas/nginx-formula
    - /srv/formulas/php-formula
    - /srv/formulas/supervisor-formula
    - /srv/formulas/users-formula
    - /srv/formulas/logrotate-formula

pillar_roots:
  base:
    - /srv/pillar

top_file_merging_strategy: "merge"

fileserver_backend:
  - git
  - roots

gitfs_provider: gitpython

gitfs_remotes:
    - https://github.com/saltstack-formulas/salt-formula.git:
      - base: master
    - https://github.com/saltstack-formulas/cron-formula.git:
      - base: master
    - https://github.com/saltstack-formulas/nginx-formula.git:
      - base: master
    - https://github.com/saltstack-formulas/php-formula.git:
      - base: master
    - https://github.com/saltstack-formulas/supervisor-formula.git:
      - base: master
    - https://github.com/saltstack-formulas/users-formula.git:
      - base: master
    - https://github.com/saltstack-formulas/logrotate-formula.git:
      - base: master
    - https://github.com/opensourcewebsite-org/osw-devops.git:
      - root: salt
      - base: master

ext_pillar:
  - git:
    - https://github.com/opensourcewebsite-org/osw-devops.git:
      - root: pillar

git_pillar_env: "base"

git_pillar_root: "pillar"

gitfs_saltenv_whitelist:
  base
gitfs_update_interval:
  80

EOF
systemctl restart salt-master
cat <<EOF > /etc/salt/minion_id
opensourcewebsite.org
EOF
cat <<EOF >> /etc/salt/minion
master: 127.0.0.1
EOF
systemctl restart salt-minion
sleep 60
salt-key -a opensourcewebsite.org -y

#swap
fallocate -l 4G /swapfile
chmod 600 /swapfil
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
sysctl vm.swappiness=0

#certifications for nginx
mkdir /etc/letsencrypt
mkdir /etc/letsencrypt/live
mkdir /etc/letsencrypt/live/opensourcewebsite.org
mkdir /etc/nginx
openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/letsencrypt/live/opensourcewebsite.org/privkey.pem -out /etc/letsencrypt/live/opensourcewebsite.org/fullchain.pem
openssl req -batch -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/nginx.pem -out /etc/nginx/nginx.pem
#Copy file with user-password
wget -L https://raw.githubusercontent.com/opensourcewebsite-org/osw-devops/master/pillar/users/user-passwords.txt.dist
mv user-passwords.txt.dist /srv/pillar/user-passwords.txt
