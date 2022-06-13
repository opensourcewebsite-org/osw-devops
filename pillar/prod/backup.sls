# vim: ft=yaml
---
backup_dir: '/backup'
backup_sites:
  - opensourcewebsite.org
backup_exclude_from_sites:
  - "runtime/*"
  - "vendor/*"
  - "web/assets/*"
backup_configs:
  - etc/nginx
  - etc/php
  - etc/mysql
  - etc/supervisor
  - etc/git-auto-deploy-opensourcewebsite.org.conf.json
