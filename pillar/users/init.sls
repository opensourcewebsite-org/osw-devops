{% import_text '/srv/pillar/user-passwords.txt' as password %}
{% import_yaml 'users/users.yml' as users %}
# Instruction to add a new user
# Use file users.yml
# Add variables with your data (USERNAME: SSHRSA)
# Rename user-passwords.txt.dist to user-passwords.txt and put /srv/pillar/user-passwords.txt
# Put your hash password in file user-passwords.txt
users:
{% for username, sshkey in users.items() %}
  {{ username }}:
    password: {{ password }}
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
{% endfor %}
# Instruction to remove a old user
#  USERNAME:
#    absent: True
#    purge: True
#    force: True
