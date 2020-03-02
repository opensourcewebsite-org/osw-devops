mysqld-ini:
  file.managed:
    - name: /etc/mysql/conf.d/mysqld.cnf
    - source: salt://mysqld/files/server.cnf
    - user: root
    - group: root
    - mode: 644
    - template: jinja
