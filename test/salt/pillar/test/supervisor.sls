# vim: ft=yaml
# !!!!!!!!!!!!!!!!!!!!!!!!!! TEST STATE !!!!!!!!!!!!!!!!!!!!!!!!!!!
# THIS SHOULD NOT BE USED OUTSIDE OF KITCHEN TESTING
#
# Test pillar to prevent run
# "/usr/bin/php -q /www/opensourcewebsite.org/htdocs/yii cron" and
# /usr/bin/git-auto-deploy --quiet --config /etc/git-auto-deploy-opensourcewebsite.org.conf.json
---
supervisor:
  programs:
    opensourcewebsite-cron:
      command: sleep infinity
    opensourcewebsite-gitautodeploy-8005:
      command: sleep infinity
