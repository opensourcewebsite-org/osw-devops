nginx:
#  pkg:
#  - installed
#  service:
#  - running
#  - reload: True
#  - require:
#  - pkg: nginx
  install_from_ppa: true
  ppa_version: 'stable'

  lookup:
    package: nginx
    service: nginx
    webuser: www-data
    conf_file: /etc/nginx/nginx.conf
    server_available: /etc/nginx/sites-available
    server_enabled: /etc/nginx/sites-enabled
    server_use_symlink: true
    gpg_check: true
    pid_file: /run/nginx.pid

  service:
    enable: true

  server:
    config:
      worker_processes: auto
      pid: /var/run/nginx.pid
      events:
        worker_connections: 1024
        use: epoll
      http:
        open_file_cache: 'max=1000 inactive=20s'
        open_file_cache_valid: '30s'
        open_file_cache_min_uses: 5
        open_file_cache_errors: 'off'
        sendfile: 'on'
        tcp_nopush: 'on'
        tcp_nodelay: 'on'
        types_hash_max_size: 2048
        server_tokens: 'off'
        client_body_buffer_size: '10K'
        client_header_buffer_size: '1k'
        client_max_body_size: '40m'
        large_client_header_buffers: '2 1k'
#        client_max_body_size: '128m'
#        client_body_buffer_size: '128m'

        client_body_timeout: 12
        client_header_timeout: 12
        keepalive_timeout: 15
        send_timeout: 10

        gzip: 'on'
        gzip_vary: 'on'
        gzip_disable: 'msie6'
        gzip_types: 'text/plain text/css application/json application/x-javascript text/xml application/xml application/xml+rss text/javascript application/javascript image/svg+xml image/jpeg'
        gzip_comp_level: 5
        gzip_min_length: 800
        gzip_proxied: 'any'
        expires: '1w'
        proxy_read_timeout: 7777
        proxy_connect_timeout: 7777

        access_log: 'off'
#        access_log: '/var/log/nginx/access.log'
        error_log: '/var/log/nginx/error.log'

        fastcgi_buffers: '8 16k'
        fastcgi_buffer_size: '32k'
        fastcgi_send_timeout: 7777
        fastcgi_connect_timeout: 7777
        fastcgi_read_timeout: 7777

        default_type: 'application/octet-stream'

        ssl_protocols: 'TLSv1.2 TLSv1.3'
        ssl_prefer_server_ciphers: 'on'
        ssl_ciphers: 'TLS-CHACHA20-POLY1305-SHA256:TLS-AES-256-GCM-SHA384:TLS-AES-128-GCM-SHA256:ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK'
        ssl_session_timeout: '4h'
        ssl_session_cache: 'shared:SSL:40m'
        ssl_dhparam: '/etc/nginx/ssl/dhparam.pem'
        ssl_ecdh_curve: 'secp384r1'
        ssl_early_data: 'on'
        resolver_timeout: '10s'
        resolver: '8.8.8.8 8.8.4.4 valid=300s'

        include:
          - /etc/nginx/mime.types
          - /etc/nginx/conf.d/*.conf
          - /etc/nginx/sites-enabled/*
      #   - cloudflare

  servers:
    managed:

      supervisor:
        enabled: True
        available_dir: /etc/nginx/sites-available
        enabled_dir: /etc/nginx/sites-enabled
        overwrite: True
        config:
          - server:
            - server_name: _
            - listen:
              - 9001 ssl
            - access_log:
              - 'off'
            - error_log:
              - /var/log/nginx/error.log
            - ssl_certificate:
              - /etc/nginx/nginx.pem
            - ssl_certificate_key:
              - /etc/nginx/nginx.pem
            - auth_basic:
              - "\u0022closed site\u0022"
            - auth_basic_user_file:
              - htpasswd
            - location /:
              - proxy_pass:
                - "http://127.0.0.1:9002"
              - proxy_set_header:
                - Host $host:$server_port
              - proxy_set_header:
                - X-Forwaded-For $proxy_add_x_forwarded_for
              - proxy_redirect:
                - http:// https://

      opensourcewebsite.org:
        enabled: True
        available_dir: /etc/nginx/sites-available
        enabled_dir: /etc/nginx/sites-enabled
        overwrite: True
        config:
          - server:
            - server_name: opensourcewebsite.org
            - listen:
              - 80
            - root:
              - /www/opensourcewebsite.org/htdocs/web
            - index:
              - index.php
            - location ^~ /.well-known/:
              - default_type:
                - "text/plain"
            - location = /.well-known/:
              - return:
                - 404
            - location /:
              - return:
                - 301 https://$server_name$request_uri

          - server:
            - server_name: opensourcewebsite.org
            - listen:
              - 443 ssl http2
            - root:
              - /www/opensourcewebsite.org/htdocs/web
            - index:
              - index.php
            - ssl_certificate:
              - /etc/letsencrypt/live/opensourcewebsite.org/fullchain.pem
            - ssl_certificate_key:
              - /etc/letsencrypt/live/opensourcewebsite.org/privkey.pem
            - ssl_stapling:
              - 'on'
            - ssl_stapling_verify:
              - 'on'
            - access_log:
              - 'off'
            - proxy_intercept_errors:
              - 'on'
            - fastcgi_intercept_errors:
              - 'on'
            - location = /.well-known/stellar.toml:
              - add_header:
                - "'Access-Control-Allow-Origin' '*'"
              - default_type:
                - "text/plain"
            - location ^~ /.well-known/:
              - default_type:
                - "text/plain"
            - location = /.well-known/:
              - return:
                - 404
            - location ~ /\.:
              - deny:
                - all
              - log_not_found:
                - 'off'
            - location /:
              - try_files:
                - $uri $uri/ /index.php?$args
            - location ~ \.php$:
              - try_files:
                - $uri =404
              - fastcgi_split_path_info:
                - ^(.+\.php)(/.+)$
              - fastcgi_pass:
                - unix:/run/php/php7.4-opensourcewebsite.org.sock
              - fastcgi_index:
                - index.php
              - fastcgi_param:
                - SCRIPT_FILENAME $document_root$fastcgi_script_name
              - include:
                - fastcgi_params

  certificates_path: '/etc/nginx/ssl'
  dh_param:
    'dhparam.pem':
      keysize: 4096
