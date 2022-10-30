# vim: ft=yaml
---
salt:
  clean_config_d_dir: true
  minion_remove_config: false
  master_remove_config: false
  install_packages: true
  py_ver: 'py3'
  version: 3005.1+ds-2
  release: '3005.1'
  lookup:
    salt_master: 'salt-master'
    salt_minion: 'salt-minion'
  master:
    fileserver_backend:
      - git
    gitfs_provider: gitpython
    gitfs_update_interval: 63072000
    gitfs_remotes:
      - https://github.com/saltstack-formulas/salt-formula.git
      - https://github.com/saltstack-formulas/cron-formula.git
      - https://github.com/saltstack-formulas/nginx-formula.git
      - https://github.com/saltstack-formulas/php-formula.git
      - https://github.com/saltstack-formulas/supervisor-formula.git
      - https://github.com/saltstack-formulas/users-formula.git
      - https://github.com/saltstack-formulas/logrotate-formula.git
      - https://github.com/opensourcewebsite-org/osw-devops.git:
          - root: salt
    git_pillar_provider: gitpython
    gitfs_saltenv_whitelist:
      - base
    pillarenv_from_saltenv: true
    git_pillar_root: pillar
    ext_pillar:
      - git:
          - master https://github.com/opensourcewebsite-org/osw-devops.git


  minion:
    master: 127.0.0.1
#    schedule:
#      - highstate:
#        - function: state.apply
#        - minutes: 100000

salt_formulas:
  git_opts:
    default:
      baseurl: https://github.com/saltstack-formulas
      basedir: /srv/formulas
      update: true
      options:
        rev: master
  basedir_opts:
    makedirs: true
    user: root
    group: root
    mode: 755
  checkout_orig_branch: true
  list:
    base:
      - salt-formula
      - cron-formula
      - nginx-formula
      - php-formula
      - supervisor-formula
      - users-formula
      - logrotate-formula
