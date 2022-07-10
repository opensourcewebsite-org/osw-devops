# vim: ft=yaml
---
{% import_text '/srv/user-passwords.txt' as hash %}
{% import_yaml 'users/users.yml' as users %}

users:
  {% for username, sshkey in users.items() %}
  {{ username }}:
    password: {{ hash }}
    enforce_password: true
    home: /home/{{ username }}
    homedir_owner: {{ username }}
    homedir_group: {{ username }}
    user_dir_mode: 700
    manage_profile: false
    createhome: true
    expire: -1
    sudouser: true
    sudo_rules:
      - ALL=(root) PASSWD:ALL
    sudo_defaults:
      - 'requiretty,env_reset,timestamp_timeout=0'
    shell: /bin/bash
    prime_group:
      name: {{ username }}
    ssh_auth:
      - {{ sshkey }}
  {% endfor %}
  # Instruction to remove a old user
  # USERNAME:
  #   absent: true
  #   purge: true
  #   force: true
  maxsh:
    absent: true
    purge: true
    force: true
