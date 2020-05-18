{% import_text 'users/secret_pass.txt' as secret_pass %}
{% import_yaml 'users/users.yml' as data_users %}
# Instruction to add a new user
# Use same password
# Replace variables with your data (USERNAME, FIRSTNAME, LASTNAME, SSHRSA)
# Put new user first in user lists
#  USERNAME:
#    fullname: FIRSTNAME LASTNAME
#    password: #TODO
#    enforce_password: True
#    home: /home/USERNAME
#    homedir_owner: USERNAME
#    homedir_group: USERNAME
#    user_dir_mode: 700
#    manage_profile: False
#    createhome: True
#    expire: 4102444800
#    sudouser: True
#    sudo_rules:
#      - ALL=(root) PASSWD:ALL
#    sudo_defaults:
#      - 'requiretty,env_reset,timestamp_timeout=0'
#    shell: /bin/bash
#    prime_group:
#      name: USERNAME
#    ssh_auth:
#      - ssh-rsa SSHRSA
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
      - ALL=(ALL) PASSWD:ALL
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
