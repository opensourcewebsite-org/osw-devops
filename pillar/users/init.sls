# {% from "users/map.jinja" import user with context %}
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

{% for usr in ['moe','larry','curly'] %}
users:
  {{ usr }}:
    password: {{ usr }}
    enforce_password: True
    home: /home/{{ usr }}
    homedir_owner: {{ usr }}
    homedir_group: {{ usr }}
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
      name: {{ usr }}
    ssh_auth:
      - ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAFWi44Jxbkk4fzPFkDtElsxHeJ2bLHg5/KnjV0+h5zH8VRC71bkW2kqsOfTbjI1yHfWPmPQMDHL6Aj7jeg1qsRrDgGYj3chGo7asXn1lo84eiNtpFrjfFNYYfY7AYiXkAxMiYmWbm4+WXwW31Rz+xI5E20VKbjKeI740o1i28Bq52qdJw== ecdsa-key-20200515
{% endfor %}
# Put here new user

  grandmotivator:
    password: {{ user.password }}
    enforce_password: True
    home: /home/grandmotivator
    homedir_owner: grandmotivator
    homedir_group: grandmotivator
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
      name: grandmotivator
    ssh_auth:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC1DhhHPprFDVQ7q2w7aJZcZ8fLArzNffhwybeDGU9vOW/QIxDFmz0FQc0nJ7BhQSYcT6o0n/3RmH0aPvJptmFY2/ttldu6y3F5SXEp68TwCBJ+e1tIaP9PYwyuBwSPwxssT0UX6Bv2nY6lbl6ExuKmrRajKg+UB9RRTO61IQnz0ME+rsHBVdqiNoX8j3tv2jUK/RKU7y2IQKySTtdNuThu67vC7SD61GEURSKa3YZWWpwwVR+1hRtdApoyUuR0Ek8Lx0AWlFTd+CPu71vT7ZHx8oeDq6Pil8TxvY+TmTd6l8Kbb9MYkFPI+QHmQLp2Dm88RJzOoB1RDGMMpQq/GqJf0w+6a3exnbM4rnMcTHKg+IlPxpYS9Qy7Yo1Lq+QekSup88btezD+BkSF+u4MyU4lgQsM+Nm1E1k4IOJ3A5HYxnuxJVL5OCiMHzAaqHFsO2qK7Ds2b0UKaBie8QmAMSbsbRs8Q5sIKsEugVFPqDLZUqsGXmmGAe7ubpAieMCWnD/LSntETSko+J6zLYYEDZyhbwLMnJJV+0my3c3CCMBMIwSOe51rgbQ3HYjn8htcFouTTmLD6Ksk8UDoq4Hxzm0sLJN4TwpEKFvdyuITAyPTTOy2u43Na4VbJ8zrBBtlWqKjWqCQ1WjQUa2cazk2d/W4O7hZtJXafnjCoSL0pVh1Uw== grandmotivator

# Instruction to remove a old user
#  USERNAME:
#    absent: True
#    purge: True
#    force: True
