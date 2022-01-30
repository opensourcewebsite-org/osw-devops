supervisor-pip:
  pkg.latest:
    - pkgs:
    {% if grains['oscodename'] == 'bionic' %}
      - python-pip
      - python3-pip
    {% elif grains['oscodename'] == 'focal' %}
      - python3-pip
    {% endif %}

superlance:
  pip.installed:
    - name: superlance
    - require:
      - pkg: supervisor-pip

include:
  - supervisor

/etc/supervisor/conf.d/_inet-supervisor.conf:
  file.managed:
    - source: salt://supervisord/files/inet-supervisor.conf
    - user: root
    - group: root
    - mode: 644
    - watch_in:
        - service: supervisor.service

/etc/supervisor/conf.d/_fatal-mail-batch.conf:
  file.managed:
    - source: salt://supervisord/files/fatal-mail-batch.conf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - watch_in:
        - service: supervisor.service
    - require:
      - superlance

chown_log_file:
  file.managed:
    - name: /www/opensourcewebsite.org/logs/cron-stdout.log
    - user: opensourcewebsite.org
    - group: opensourcewebsite.org
    - mode: 644
    - create: true
    - replace: false
    - makedirs: true
    - watch_in:
        - service: supervisor.service

chown_log_file2:
  file.managed:
    - name: /www/opensourcewebsite.org/logs/cron-stderr.log
    - user: opensourcewebsite.org
    - group: opensourcewebsite.org
    - mode: 644
    - create: true
    - replace: false
    - makedirs: true
    - watch_in:
        - service: supervisor.service
