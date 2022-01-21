salt:
  clean_config_d_dir: True
  minion_remove_config: False
  master_remove_config: False
  install_packages: True
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
#        - privkey: /root/.ssh/id_rsa
#        - pubkey: /root/.ssh/id_rsa.pub
        - root: salt
        - base: master
    top_file_merging_strategy: merge
    #winrepo_provider: gitpython
    #gitfs_provider: gitpython
    gitfs_saltenv_whitelist: base
    git_pillar_env: base
    git_pillar_root: pillar
    gitfs_update_interval: 63072000
    roots_update_interval: 63072000
    ext_pillar:
      - git:
        - https://github.com/opensourcewebsite-org/osw-devops.git:
          - root: pillar
#          - privkey: /root/.ssh/id_rsa
#          - pubkey: /root/.ssh/id_rsa.pub
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
      update: True
      options:
        rev: master
  basedir_opts:
    makedirs: True
    user: root
    group: root
    mode: 755
  checkout_orig_branch: True
  list:
    base:
      - salt-formula
      - cron-formula
      - nginx-formula
      - php-formula
      - supervisor-formula
      - users-formula
      - logrotate-formula
