get-composer:
  cmd.run:
    - name: 'curl -sS https://getcomposer.org/installer -o composer-setup.php | php composer-setup.php --install-dir=/usr/local/bin --filename=composer'
    - cwd: /root/

#install-composer:
#  cmd.wait:
#    - name: mv /root/composer.phar /usr/local/bin/composer
#    - cwd: /root/
#    - watch:
#      - cmd: get-composer

{% for user in pillar['composerusers'] %}
init-composer-{{user}}:
  cmd.run:
    - name: 'composer global require "fxp/composer-asset-plugin:1.*"'
    - runas: {{user}}
    - cwd: /www/{{user}}
    - shell: /bin/bash
    - env:
      - COMPOSER_HOME: '/www/{{user}}/.config/composer'
    - unless: test -d /www/{{user}}/.config/composer
    - require:
      - cmd: get-composer
discard-changes-{{user}}:
  cmd.run:
    - name: 'composer config --global discard-changes true'
    - runas: {{user}}
    - cwd: /www/{{user}}
    - shell: /bin/bash
    - env:
      - COMPOSER_HOME: '/www/{{user}}/.config/composer'
    - require:
      - cmd: get-composer
{% endfor %}
