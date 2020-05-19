base:
  '*':
    - match: compound
    - repos
    - packages
    - cron
    - users
    - users.profile
    - tmux
    - auditd
    - rsyslog
    - sysctl
    - users.log_acl
    - update_motd_d
    - users.selected_editor
  'opensourcewebsite.org':
    - nginx
    - php.fpm
    - php.zip
    - php.mbstring
    - php.gd
    - php.imagick
    - php.intl
    - php.curl
    - php.mysql
    - php.cli
    - php.xml
    - gitautodeploy
    - supervisord
    - composer
    - backup
    - logrotate
    - logrotate.jobs
  #  - salt.master
    - salt.formulas
    - php_ext
  #  - salt.minion
