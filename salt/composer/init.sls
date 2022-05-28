install-composer:
  pkg.installed:
    - name: composer

{% for user in pillar['composerusers'] %}
init-composer-{{user}}:
  cmd.run:
    - name: 'composer global require "fxp/composer-asset-plugin:1.*"'
    - runas: {{user}}
    - cwd: /www/{{user}}
    - shell: /bin/bash
    - env:
      - COMPOSER_HOME: '/www/{{user}}/.config/composer'
    - unless: test -f /www/{{user}}/.config/composer/composer.json
    - require:
      - pkg: install-composer
discard-changes-{{user}}:
  cmd.run:
    - name: 'composer config --global discard-changes true'
    - runas: {{user}}
    - cwd: /www/{{user}}
    - shell: /bin/bash
    - env:
      - COMPOSER_HOME: '/www/{{user}}/.config/composer'
    - require:
      - pkg: install-composer
{% endfor %}
