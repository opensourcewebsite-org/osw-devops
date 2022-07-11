install-composer:
  pkg.installed:
    - name: composer

{% for user in pillar['composerusers'] %}
discard-changes-{{ user }}:
  cmd.run:
    - name: 'composer config --global discard-changes true'
    - runas: {{ user }}
    - cwd: /www/{{ user }}
    - shell: /bin/bash
    - env:
      - COMPOSER_HOME: '/www/{{ user }}/.config/composer'
    - require:
      - pkg: install-composer
{% endfor %}
