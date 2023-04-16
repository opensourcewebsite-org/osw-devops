debconf-utils:
  pkg.installed:
    - order: 1

exim_packages:
  pkg.installed:
    - pkgs:
      - exim4
    - require:
      - debconf: exim4_config
    - order: 2

exim4_setup:
  debconf.set:
    - name: exim4_config
    - data:
        'exim4/mailname': {'type': 'string', 'value': {{ grains['localhost'] }} }
        'exim4/dc_localdelivery': {'type': 'select', 'value': 'mbox format in /var/mail/'}
        'exim4/dc_eximconfig_configtype': {'type': 'select', 'value': 'internet site; mail is sent and received directly using SMTP'}
        'exim4/use_split_config': {'type': 'boolean', 'value': false}
        'exim4/dc_local_interfaces': {'type': 'string', 'value': '127.0.0.1'}
        'exim4/dc_other_hostnames': {'type': 'string', 'value': 'localhost'}
        'exim4/dc_postmaster': {'type': 'string', 'value': 'root'}
    - require:
      - pkg: debconf-utils

exim4_service:
  service.running:
    - name: exim4
    - enable: True
    - watch:
      - file: /etc/exim4/*

create_dir_dkim:
  file.directory:
    - name: /etc/exim4/dkim
    - makedirs: True
    - user: Debian-exim
    - group: Debian-exim
    - recurse:
       - user
       - group

generate_private_cert:
  cmd.run:
    - name: openssl genrsa -out {{ pillar['dkim_private_key'] }} 1024
    - runas: Debian-exim
    - cwd: /etc/exim4/dkim/
    - creates: /etc/exim4/dkim/{{ pillar['dkim_private_key'] }}

generate_public_cert:
  cmd.run:
    - name: openssl rsa -pubout -in {{ pillar['dkim_private_key'] }} -out {{ pillar['dkim_public_key'] }}
    - runas: Debian-exim
    - cwd: /etc/exim4/dkim/
    - creates: /etc/exim4/dkim/{{ pillar['dkim_public_key'] }}

chown_dkim:
  file.directory:
    - name: /etc/exim4/dkim
    - makedirs: True
    - user: Debian-exim
    - group: Debian-exim
    - recurse:
       - user
       - group

exim4_dkim:
  file.blockreplace:
    - name: /etc/exim4/exim4.conf.template
    - marker_start: "### end transport/30_exim4-config_procmail_pipe"
    - marker_end: "remote_smtp:"
    - content: |
           DKIM_DOMAIN = ${lc:${domain:$h_from:}}
           DKIM_KEY_FILE = /etc/exim4/dkim/{{ pillar['dkim_private_key'] }}
           DKIM_PRIVATE_KEY = ${if exists{DKIM_KEY_FILE}{DKIM_KEY_FILE}{0}}
           DKIM_SELECTOR = {{ pillar['dkim_selector'] }}
    - show_changes: True

exim4_config_localmail:
  file.line:
    - name: /etc/exim4/exim4.conf.template
    - mode: replace
    - content: 'domainlist local_domains = localhost : localhost.localdomain'
    - match: 'domainlist local_domains = MAIN_LOCAL_DOMAINS'

exim4_config_localmacros:
  file.managed:
    - name: /etc/exim4/exim4.conf.localmacros
    - contents: 'MAIN_TLS_ENABLE = 1'

exim4_conf:
  file.managed:
    - name: /etc/exim4/update-exim4.conf.conf
    - contents: |
           dc_eximconfig_configtype='smarthost'
           dc_other_hostnames=''
           dc_local_interfaces='127.0.0.1'
           dc_readhost='opensourcewebsite.org'
           dc_relay_domains=''
           dc_minimaldns='false'
           dc_relay_nets=''
           dc_smarthost='smtp.sendgrid.net::587'
           CFILEMODE='644'
           dc_use_split_config='false'
           dc_hide_mailname='true'
           dc_mailname_in_oh='true'
           dc_localdelivery='mail_spool'

exim4_passwd_client:
  file.managed:
    - name: /etc/exim4/passwd.client
    - user: root
    - group: Debian-exim
    - mode: 640
    - create: True
    - replace: False
    - contents: '*:apikey:<SetYourAPIKey>'
