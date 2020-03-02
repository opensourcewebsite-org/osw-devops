certbot-pkg:
  pkg.latest:
    - name: certbot
    - refresh: True

include:
  - letsencrypt
