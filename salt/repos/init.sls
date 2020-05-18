certbot-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: certbot/certbot

deadsnakes-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: deadsnakes/ppa

nginx-stable-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: nginx/stable

olipo186-git-auto-deploy-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: olipo186/git-auto-deploy

ondrej-php-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: ondrej/php

openjdk-r-ppa-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: openjdk-r/ppa

#saltstack-ubuntu-bionic-pkgrepo:
#  pkgrepo.managed:
#    - humanname:  SaltStack Package Repository
#    - name:       deb http://repo.saltstack.com/apt/ubuntu/ubuntu{{ grains['osrelease_info'][0] }}/latest {{ grains['oscodename'] }} main
#    - dist:       {{ grains['oscodename'] }}
#    - file:       /etc/apt/sources.list.d/saltstack.list
#    - gpgcheck:   1
#    - key_url:    https://repo.saltstack.com/apt/ubuntu/ubuntu{{ grains['osrelease_info'][0] }}/latest/SALTSTACK-GPG-KEY.pub
#    - clean_file: true

# https://wiki.ubuntu.com/Mirrors
#sg-ubuntu-bionic-pkgrepo:
#  pkgrepo.managed:
#    - name: deb http://sg.archive.ubuntu.com/ubuntu bionic main
#    - file: /etc/apt/sources.list.d/sg-ubuntu-bionic.list

#zabbix-ubuntu-bionic-pkgrepo:
#  pkgrepo.managed:
#    - name: deb http://repo.zabbix.com/zabbix/4.2/ubuntu bionic main
#    - file: /etc/apt/sources.list.d/zabbix-ubuntu-bionic.list
#    - keyid: 082AB56BA14FE591
#    - keyserver: keyserver.ubuntu.com
