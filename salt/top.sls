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
  'opensourcewebsite.org or osw-devops-ci':
    - match: compound
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
    - php.soap
    - php.bcmath
    - gitautodeploy
    - supervisord
    - composer
    - backup
    - logrotate
    - logrotate.jobs
    # - salt.master
    - salt.formulas
    - exim
    # - salt.minion
  'osw-devops-ci':
    # Overrides for Kitchen testing
    - states.setup-certs
    - states.adjust-auditd-conf-for-container
