# vim: ft=yaml
---
salt:
  clean_config_d_dir: true
  minion_remove_config: true
  master_remove_config: false
  install_packages: true
  py_ver: 'py3'
  version: 3006.5
  release: '3006.5'
  lookup:
    salt_minion: 'salt-minion'
  minion:
    master: 127.0.0.1
#    schedule:
#      - highstate:
#        - function: state.apply
#        - minutes: 100000
