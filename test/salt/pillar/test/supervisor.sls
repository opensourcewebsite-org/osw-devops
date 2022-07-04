# vim: ft=yaml
# !!!!!!!!!!!!!!!!!!!!!!!!!! TEST STATE !!!!!!!!!!!!!!!!!!!!!!!!!!!
# THIS SHOULD NOT BE USED OUTSIDE OF KITCHEN TESTING
#
# Test pillar to prevent run
# "/usr/bin/php -q /www/opensourcewebsite.org/htdocs/yii cron"
---
supervisor:
    opensourcewebsite-cron:
      command: sleep infinity
