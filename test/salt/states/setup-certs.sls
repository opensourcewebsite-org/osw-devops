# !!!!!!!!!!!!!!!!!!!!!!!!!! TEST STATE !!!!!!!!!!!!!!!!!!!!!!!!!!!
# THIS SHOULD NOT BE USED OUTSIDE OF KITCHEN TESTING
#
# Test state to create dummy certificates for Nginx
# (Simulates commands used in `install.sh`)

include:
  - nginx.service

/etc/letsencrypt/live/opensourcewebsite.org/privkey.pem:
  file.managed:
    - name: /etc/letsencrypt/live/opensourcewebsite.org/privkey.pem
    - source: salt://files/privkey.pem
    - makedirs: true
    - watch_in:
      - service: nginx_service

/etc/letsencrypt/live/opensourcewebsite.org/fullchain.pem:
  file.managed:
    - name: /etc/letsencrypt/live/opensourcewebsite.org/fullchain.pem
    - source: salt://files/fullchain.pem
    - makedirs: true
    - watch_in:
      - service: nginx_service

/etc/nginx/nginx.pem:
  file.managed:
    - name: /etc/nginx/nginx.pem
    - source: salt://files/nginx.pem
    - makedirs: true
    - watch_in:
      - service: nginx_service
