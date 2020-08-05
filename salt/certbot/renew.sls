cerbot-renew-cert:
  file.append:
    - name: /etc/letsencrypt/cli.ini
    - text: deploy-hook = systemctl reload nginx
