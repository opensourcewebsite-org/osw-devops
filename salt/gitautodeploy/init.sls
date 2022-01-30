git-auto-deploy-pkg:
  pkg.latest:
    - name: git-auto-deploy
    - refresh: True

git-auto-deploy-service:
  service.disabled:
    - name: git-auto-deploy

/etc/git-auto-deploy-opensourcewebsite.org.conf.json:
  file.managed:
    - source: salt://gitautodeploy/files/git-auto-deploy-opensourcewebsite.org.conf.json
    - user: git-auto-deploy
    - group: git-auto-deploy
    - mode: 644
      
/www/opensourcewebsite.org/htdocs/:
  file.directory:
    - mode: 775

/www/opensourcewebsite.org/logs/:
  file.directory:
    - mode: 775

/www/opensourcewebsite.org/tmp/:
  file.directory:
    - mode: 775
