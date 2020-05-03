salt:
  clean_config_d_dir: True
  minion_remove_config: True
  master_remove_config: False
  install_packages: True
  py_ver: 'py3'
  version: 3000.2+ds-1
  lookup:
    salt_minion: 'salt-minion'
  release: '3000.2'
  minion:
    master: opensourcewebsite.org
#    schedule:
#      - highstate:
#        - function: state.apply
#        - minutes: 100000
