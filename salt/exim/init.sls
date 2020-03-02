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
