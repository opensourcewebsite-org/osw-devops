logrotate:
  # default OS values can be overridden in 'lookup' dict
  # lookup:
  #   pkg: logrotate
  #   service: crond
  default_config:
    su: root syslog
    weekly: true
    rotate: 52
    copytruncate: true
    compress: true
    delaycompress: true
    minsize: 10K
    maxsize: 1M

  jobs:
    syslog:
      path:
        - /var/log/syslog
      config:
        - daily
        - rotate 30
        - missingok
        - notifempty
        - create
        - sharedscripts
        - postrotate
        - /usr/lib/rsyslog/rsyslog-rotate
        - endscript
        - minsize 10K
        - maxsize 10M
    rsyslog:
      path:
        - /var/log/cron
        - /var/log/maillog
        - /var/log/messages
        - /var/log/secure
        - /var/log/spooler
        - /var/log/slapd.log
        - /var/log/mail.info
        - /var/log/mail.warn
        - /var/log/mail.err
        - /var/log/mail.log
        - /var/log/daemon.log
        - /var/log/kern.log
        - /var/log/auth.log
        - /var/log/user.log
        - /var/log/lpr.log
        - /var/log/cron.log
        - /var/log/debug
      config:
        - missingok
        - notifempty
        - create
        - sharedscripts
        - postrotate
        - /usr/lib/rsyslog/rsyslog-rotate
        - endscript
    dpkg:
      path:
        - /var/log/dpkg.log
        - /var/log/alternatives.log
      config:
        - missingok
        - notifempty
        - sharedscripts
    apt:
      path:
        - /var/log/apt/*.log
      config:
        - missingok
        - notifempty
        - sharedscripts
    certbot:
      path:
        - /var/log/letsencrypt/*.log
      config:
        - missingok
        - notifempty
        - sharedscripts
    nginx:
      path:
        - /var/log/nginx/*.log
      config:
        - missingok
        - notifempty
        - sharedscripts
        - prerotate
        - if [ -d /etc/logrotate.d/httpd-prerotate ]; then \
        - run-parts /etc/logrotate.d/httpd-prerotate; \
        - fi \
        - endscript
        - postrotate
        - invoke-rc.d nginx rotate >/dev/null 2>&1
        - endscript
    php7.4-fpm:
      path:
        - /var/log/php7.4-fpm.log
      config:
        - missingok
        - notifempty
        - sharedscripts
        - postrotate
        - /usr/lib/php/php7.4-fpm-reopenlogs
        - endscript
    salt-common:
      path:
        - /var/log/salt/master
        - /var/log/salt/minion
        - /var/log/salt/key
      config:
        - missingok
        - notifempty
        - sharedscripts
    unattended-upgrades:
      path:
        - /var/log/unattended-upgrades/*.log
      config:
        - missingok
        - notifempty
        - sharedscripts
    opensourcewebsite.org:
      path:
        - /www/opensourcewebsite.org/logs/git-auto-deploy.log
        - /www/opensourcewebsite.org/htdocs/runtime/logs/*.log
      config:
        - su opensourcewebsite.org opensourcewebsite.org
        - missingok
        - notifempty
        - sharedscripts
    php-fpm-slow:
      path:
        - /www/opensourcewebsite.org/logs/slow.log
        - /var/log/*slow.log
      config:
        - missingok
        - notifempty
        - sharedscripts
