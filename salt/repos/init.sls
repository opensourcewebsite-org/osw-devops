certbot-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/certbot/certbot/ubuntu xenial main
    - file: /etc/apt/sources.list.d/certbot-ubuntu-xenial.list

deadsnakes-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/deadsnakes/ppa/ubuntu xenial main
    - file: /etc/apt/sources.list.d/deadsnakes-ubuntu-xenial.list

digitalocean-pkgrepo:
  pkgrepo.managed:
    - name: deb https://repos.sonar.digitalocean.com/apt main main
    - file: /etc/apt/sources.list.d/digitalocean.list

digitalocean-agent-pkgrepo:
  pkgrepo.managed:
    - name: deb https://repos.insights.digitalocean.com/apt/do-agent main main
    - file: /etc/apt/sources.list.d/digitalocean-agent.list

gitlab-runner-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb https://packages.gitlab.com/runner/gitlab-runner/ubuntu/ xenial main
    - file: /etc/apt/sources.list.d/gitlab-runner-ubuntu-xenial.list

nginx-stable-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/nginx/stable/ubuntu xenial main
    - file: /etc/apt/sources.list.d/nginx-stable-ubuntu-xenial.list

olipo186-git-auto-deploy-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/olipo186/git-auto-deploy/ubuntu xenial main
    - file: /etc/apt/sources.list.d/olipo186-git-auto-deploy-ubuntu-xenial.list

ondrej-php-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/ondrej/php/ubuntu xenial main
    - file: /etc/apt/sources.list.d/ondrej-php-ubuntu-xenial.list

openjdk-r-ppa-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://ppa.launchpad.net/openjdk-r/ppa/ubuntu xenial main
    - file: /etc/apt/sources.list.d/openjdk-r-ppa-ubuntu-xenial.list

saltstack-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://repo.saltstack.com/py3/ubuntu/16.04/amd64/latest xenial main
    - file: /etc/apt/sources.list.d/saltstack-ubuntu-xenial.list

# https://wiki.ubuntu.com/Mirrors
sg-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://sg.archive.ubuntu.com/ubuntu xenial main
    - file: /etc/apt/sources.list.d/sg-ubuntu-xenial.list

zabbix-ubuntu-xenial-pkgrepo:
  pkgrepo.managed:
    - name: deb http://repo.zabbix.com/zabbix/4.2/ubuntu xenial main
    - file: /etc/apt/sources.list.d/zabbix-ubuntu-xenial.list
