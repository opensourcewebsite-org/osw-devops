# vim: ft=yaml
---
salt:
  clean_config_d_dir: true
  minion_remove_config: false
  master_remove_config: false
  install_packages: true
  py_ver: 'py3'
  version: 3004
  lookup:
    salt_master: 'salt-master'
    salt_minion: 'salt-minion'
  release: '3004'
  master:
    fileserver_backend:
      - git
      - roots
    file_roots:
      base:
        - /srv/salt
    pillar_roots:
      base:
        - /srv/pillar
    gitfs_remotes:
      - https://github.com/saltstack-formulas/salt-formula.git:
          - base: master
      - https://github.com/saltstack-formulas/cron-formula.git:
          - base: master
      - https://github.com/saltstack-formulas/nginx-formula.git:
          - base: master
      - https://github.com/saltstack-formulas/php-formula.git:
          - base: master
      - https://github.com/saltstack-formulas/supervisor-formula.git:
          - base: master
      - https://github.com/saltstack-formulas/users-formula.git:
          - base: master
      - https://github.com/saltstack-formulas/logrotate-formula.git:
          - base: master
      - https://github.com/opensourcewebsite-org/osw-devops.git:
          - root: salt
          - base: master
    top_file_merging_strategy: merge
    gitfs_provider: gitpython
    git_pillar_provider: gitpython
    gitfs_saltenv_whitelist: base
    git_pillar_env: base
    git_pillar_root: pillar
    gitfs_update_interval: 63072000
    roots_update_interval: 63072000
    ext_pillar:
      - git:
          - master https://github.com/opensourcewebsite-org/osw-devops.git:
              - root: pillar
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
