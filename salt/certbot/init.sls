include:
  - .renew

certbot-pkg:
  pkg.latest:
    - name: certbot
    - refresh: True
