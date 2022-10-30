base:
  '*':
    - repos
    - packages
    - cron
    - users
    - users.profile
    - tmux
    - auditd
    - rsyslog
    - sudoers
    - sysctl
    - users.log_acl
    - update_motd_d
    - users.directory
    - users.selected_editor
  '* and not osw-devops-ci':
    - match: compound
    - salt.minion
  'opensourcewebsite.org or osw-devops-ci':
    - match: compound
    - nginx
    - pip
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
    - php.soap
    - php.bcmath
    - gitautodeploy
    - supervisord
    - composer
    - backup
    - logrotate
    - logrotate.jobs
    - exim
  'opensourcewebsite.org':
    - salt.master
    - salt.formulas
  'osw-devops-ci':
    # Overrides for Kitchen testing
    - states.setup-certs
    - states.adjust-auditd-conf-for-container
