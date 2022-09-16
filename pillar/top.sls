# vim: ft=yaml
---
# Pillar definitions
# WARNING: DO NOT CHANGE THE ORDER
# We are using pillar overwrites!
base:
  '*':
    - users.init
  '* and not osw-devops-ci':
    - match: compound
    - salt
  'opensourcewebsite.org or osw-devops-ci':
    - match: compound
    - prod.users
    - prod.php74
    - prod.nginx
    - prod.supervisor
    - prod.composer
    - prod.backup
    - prod.logrotate
    - prod.exim
  'opensourcewebsite.org':
    - prod.salt
  'osw-devops-ci':
    # Overrides for Kitchen testing
    - test.nginx
    - test.supervisor
