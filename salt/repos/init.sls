certbot-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: certbot/certbot

deadsnakes-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: deadsnakes/ppa

gitlab-runner-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ bionic main
    - file: /etc/apt/sources.list.d/gitlab-runner-ubuntu-bionic.list

nginx-stable-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/nginx/stable/ubuntu bionic main
    - file: /etc/apt/sources.list.d/nginx-stable-ubuntu-bionic.list

olipo186-git-auto-deploy-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/olipo186/git-auto-deploy/ubuntu bionic main
    - file: /etc/apt/sources.list.d/olipo186-git-auto-deploy-ubuntu-bionic.list

ondrej-php-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu bionic main
    - file: /etc/apt/sources.list.d/ondrej-php-ubuntu-bionic.list

openjdk-r-ppa-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu bionic main
    - file: /etc/apt/sources.list.d/openjdk-r-ppa-ubuntu-bionic.list

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
