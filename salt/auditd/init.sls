{% from "auditd/map.jinja" import auditd with context %}

{{ auditd.pkg }}:
  pkg.installed: []
  service.running:
    - name: {{ auditd.service }}
    - watch:
      - file: {{ auditd.config }}

{{ auditd.config }}:
  file.managed:
    - source: {{ auditd.config_source }}
    - mode: '0600'

{{ auditd.systemd_unit }}:
  file.managed:
    - source: {{ auditd.systemd_unit_source }}
    - mode: '0600'
  module.run:
    - name: service.systemctl_reload
    - onchanges:
      - file: {{ auditd.systemd_unit }}
    - watch_in:
      - service: {{ auditd.service }}

audispd-plugins:
  pkg.installed

/etc/audisp/plugins.d/syslog.conf:
  file.replace:
    - pattern: active = no
    - repl: active = yes
    - count: 1
    - watch_in:
      - service: {{ auditd.service }}
