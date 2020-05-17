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
{% for name in pillar.get('nameusers', {}).items() %}
users:
  {{ name }}:
    password: {{ name }}
    enforce_password: True
    home: /home/{{ name }}
    homedir_owner: {{ name }}
    homedir_group: {{ name }}
    user_dir_mode: 700
    manage_profile: False
    createhome: True
    expire: -1
    sudouser: True
    sudo_rules:
      - ALL=(ALL) NOPASSWD:ALL
    sudo_defaults:
      - 'requiretty,env_reset,timestamp_timeout=0'
    shell: /bin/bash
    prime_group:
      name: {{ name }}
    ssh_auth:
      - ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFWi44Jxbkk4fzPFkDtElsxHeJ2bLHg5/KnjV0+h5zH8VRC71bkW2kqsOfTbjI1yHfWPmPQMDHL6Aj7jeg1qsRrDgGYj3chGo7asXn1lo84eiNtpFrjfFNYYfY7AYiXkAxMiYmWbm4+WXwW31Rz+xI5E20VKbjKeI740o1i28Bq52qdJw== ecdsa-key-20200515
{% endfor %}
# Put here new user
# Instruction to remove a old user
#  USERNAME:
#    absent: True
#    purge: True
#    force: True
