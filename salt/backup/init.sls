/root/backup_mysql.sh:
  file.managed:
    - source: salt://backup/files/backup_mysql.sh
    - user: root
    - group: root
    - mode: 700
    - template: jinja
    - context:
      backup_dir: {{pillar['backup_dir']}}

/root/backup_site.sh:
  file.managed:
    - source: salt://backup/files/backup_site.sh
    - user: root
    - group: root
    - mode: 700
    - template: jinja
    - context:
      backup_dir: {{pillar['backup_dir']}}
      backup_site_list: {{pillar['backup_sites'] | join(' ') }}
      backup_config_list: {{pillar['backup_configs'] | join(' ')}}

#backup-mysql:
#  cron.present:
#    - name: /root/backup_mysql.sh
#    - user: root
#    - minute: random
#    - hour: 1
#    - identifier: backup-mysql
    
backup-mysql:
  cron.absent:
    - name: /root/backup_mysql.sh
    - user: root

backup-site:
  cron.present:
    - name: /root/backup_site.sh
    - user: root
    - minute: random
    - hour: 2
    - identifier: backup-site

#{{pillar['backup_dir']}}/mysql:
#  file.directory:
#   - user: root
#    - group: root
#    - dir_mode: 750
#    - file_mode: 640
#    - makedirs: True
#    - recurse:
#      - user
#      - group
#      - mode

{{pillar['backup_dir']}}/mysql:
  file.absent:
    - name: {{pillar['backup_dir']}}/mysql
    
{{pillar['backup_dir']}}/sites:
  file.directory:
    - user: root
    - group: root
    - dir_mode: 750
    - file_mode: 640
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
