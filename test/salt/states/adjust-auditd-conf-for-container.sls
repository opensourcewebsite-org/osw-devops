{% from "auditd/map.jinja" import auditd with context %}

include:
  - auditd

/etc/audit/auditd.conf:
  file.replace:
    - name: /etc/audit/auditd.conf
    - pattern: 'local_events = yes'
    - repl: 'local_events = no'
    - watch_in:
      - service: {{ auditd.pkg }}
