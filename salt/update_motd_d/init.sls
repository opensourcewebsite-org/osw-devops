/etc/update-motd.d/10-help-text:
  file.managed:
    - name: /etc/update-motd.d/10-help-text
    - user: root
    - group: root
    - mode: 644
    - create: False

/etc/update-motd.d/51-cloudguest:
  file.managed:
    - name: /etc/update-motd.d/51-cloudguest
    - user: root
    - group: root
    - mode: 644
    - create: False
