# vim: ft=yaml
---
users:
  www-data:
    groups:
      - opensourcewebsite.org

  opensourcewebsite.org:
    fullname: opensourcewebsite org
    enforce_password: false
    empty_password: true
    system: true
    home: /www/opensourcewebsite.org
    homedir_owner: opensourcewebsite.org
    homedir_group: opensourcewebsite.org
    user_dir_mode: 750
    sudouser: false
    shell: /bin/false
    user_files:
      enabled: true
      source: users/files/opensourcewebsite.org
      file_mode: 750
    ssh_config:
      all:
        hostname: "*"
        options:
          - "StrictHostKeyChecking no"
          - "UserKnownHostsFile=/dev/null"
