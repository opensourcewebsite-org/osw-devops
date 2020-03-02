supervisor-pip:
  pkg.latest:
    - pkgs:
      - python-pip

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
