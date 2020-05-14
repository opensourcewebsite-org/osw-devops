apt_update_and_upgrade:
   cmd.run:
     - name: 'apt-get update -y && apt-get upgrade -y'
create_cert:
   cmd.run:
     - name: 'openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt'
