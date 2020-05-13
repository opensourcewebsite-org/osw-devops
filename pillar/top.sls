# Pillar definitions
# WARNING: DO NOT CHANGE THE ORDER
# We are using pillar overwrites!
base:
  '*':
    - users.init
    #- salt
  'opensourcewebsite.org':
    - prod.users
    - prod.php72
    - prod.nginx
    - prod.mysqld
    - prod.supervisor
    - prod.composer
    - prod.backup
    #- prod.logrotate
    #- prod.salt
