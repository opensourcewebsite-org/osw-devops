# vim: ft=yaml
---
supervisor:
  # pkg:
  #   - installed
  # service:
  #   - running
  #   - require:
  #     - pkg: supervisor
  legacy: false
  programs:
    opensourcewebsite-gitautodeploy-8005:
      enabled: true
      autorestart: 'true'
      autostart: 'true'
      command: >-
        /usr/bin/git-auto-deploy
        --quiet
        --config /etc/git-auto-deploy-opensourcewebsite.org.conf.json
      numprocs: '1'
      directory: '/www/opensourcewebsite.org'
      stdout_logfile: >-
        /var/log/supervisor/git-auto-deploy-opensourcewebsite.org-stdout.log
      stderr_logfile: >-
        /var/log/supervisor/git-auto-deploy-opensourcewebsite.org-stdout.log
      user: 'opensourcewebsite.org'
      stopsignal: 'KILL'

    opensourcewebsite-cron:
      enabled: true
      autorestart: 'true'
      autostart: 'true'
      command: >-
        /usr/bin/php
        -q /www/opensourcewebsite.org/htdocs/yii cron > runtime/logs/cron.log
      numprocs: '1'
      directory: '/www/opensourcewebsite.org'
      stdout_logfile: '/www/opensourcewebsite.org/logs/cron-stdout.log'
      stderr_logfile: '/www/opensourcewebsite.org/logs/cron-stderr.log'
      user: 'opensourcewebsite.org'
      stopsignal: 'KILL'

  lookup:
    service:
      name: supervisor
