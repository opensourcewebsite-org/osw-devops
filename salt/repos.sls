{% if grains['oscodename'] == 'bionic' %}

certbot-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: certbot/certbot

olipo186-git-auto-deploy-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: olipo186/git-auto-deploy

{% endif %}

deadsnakes-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: deadsnakes/ppa

ondrej-php-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: ondrej/php

openjdk-r-ppa-ubuntu-bionic-pkgrepo:
  pkgrepo.managed:
    - ppa: openjdk-r/ppa
