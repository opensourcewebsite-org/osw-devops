{% import_text '/srv/pillar/secret_pass.txt' as secret_pass %}
{% import_yaml 'users/users.yml' as data_users %}
# Instruction to add a new user
# Use file users.yml
# Add variables with your data (USERNAME: SSHRSA)
# Rename secret_pass.txt.dist to secret_pass.txt and put /srv/pillar/secret_pass.txt
# Put your hash password in file secret_pass.txt
users:
{% for username, sshkey in data_users.items() %}
  {{ username }}:
    password: {{ secret_pass }}
    enforce_password: True
    home: /home/{{ username }}
    homedir_owner: {{ username }}
    homedir_group: {{ username }}
    user_dir_mode: 700
    manage_profile: False
    createhome: True
    expire: -1
    sudouser: True
    sudo_rules:
      - ALL=(root) PASSWD:ALL
    sudo_defaults:
      - 'requiretty,env_reset,timestamp_timeout=0'
    shell: /bin/bash
    prime_group:
      name: {{ username }}
    ssh_auth:
      - {{ sshkey }}
{%- endfor -%}
# Instruction to remove a old user
#  USERNAME:
#    absent: True
#    purge: True
#    force: True
