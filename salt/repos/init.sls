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

saltstack-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://repo.saltstack.com/py3/ubuntu/18.04/amd64/latest bionic main
    - file: /etc/apt/sources.list.d/saltstack-ubuntu-bionic.list

# https://wiki.ubuntu.com/Mirrors
sg-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://sg.archive.ubuntu.com/ubuntu bionic main
    - file: /etc/apt/sources.list.d/sg-ubuntu-bionic.list

zabbix-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://repo.zabbix.com/zabbix/4.2/ubuntu bionic main
    - file: /etc/apt/sources.list.d/zabbix-ubuntu-bionic.list
