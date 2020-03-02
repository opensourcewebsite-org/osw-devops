rsyslog:
  pkg.installed: []
  service.running:
    - watch:
      - file: /etc/rsyslog.d/*

/etc/rsyslog.d/auditd.conf:
  file.managed:
    - source: salt://rsyslog/files/auditd.conf
    - user: root
    - group: root
    - mode: 400
    - template: jinja
