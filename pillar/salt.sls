salt:
  clean_config_d_dir: True
  minion_remove_config: True
  master_remove_config: False
  install_packages: True
  py_ver: 'py3'
  version: 3004
  lookup:
    salt_minion: 'salt-minion'
  release: '3004'
  minion:
    master: 127.0.0.1
#    schedule:
#      - highstate:
#        - function: state.apply
#        - minutes: 100000
