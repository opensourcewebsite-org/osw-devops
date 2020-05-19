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

create_htpasswd:
  file.line:
    - name: /etc/nginx/htpasswd
    - mode: delete
    - content:
    - create: True

generate_ssh_key:
  cmd.run:
    - name: ssh-keygen -q -b 4096 -N '' -f /www/opensourcewebsite.org/.ssh/id_rsa
