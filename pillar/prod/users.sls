users:
  www-data:
    groups:
      - opensourcewebsite.org
  git-auto-deploy:
    groups:
      - opensourcewebsite.org
  
  opensourcewebsite.org:
    fullname: opensourcewebsite org
    enforce_password: False
    empty_password: True
    system: True
    home: /www/opensourcewebsite.org
    homedir_owner: opensourcewebsite.org
    homedir_group: opensourcewebsite.org
    user_dir_mode: 750
    sudouser: False
    shell: /bin/false
    user_files:
      enabled: True
      source: users/files/opensourcewebsite.org
      file_mode: 750
    ssh_config:
      all:
        hostname: "*"
        options:
          - "StrictHostKeyChecking no"
          - "UserKnownHostsFile=/dev/null"
