salt:
  clean_config_d_dir: True
  minion_remove_config: False
  master_remove_config: False
  install_packages: True
  py_ver: 'py3'
  version: 3000+ds-1
  lookup:
    salt_master: 'salt-master'
    salt_minion: 'salt-minion'
  release: '3000'
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
      - git://github.com/saltstack-formulas/salt-formula.git:
        - base: develop
      - git@github.com:opensourcewebsite-org/osw-devops.git:
        - privkey: /root/.ssh/id_rsa
        - pubkey: /root/.ssh/id_rsa.pub
        - root: salt
        - base: master
    top_file_merging_strategy: merge
    #winrepo_provider: gitpython
    #gitfs_provider: gitpython
    gitfs_saltenv_whitelist: base
    git_pillar_env: base
    git_pillar_root: pillar
    gitfs_update_interval: 80
    ext_pillar:
      - git:
        - git@github.com:opensourcewebsite-org/osw-devops.git:
          - root: pillar
          - privkey: /root/.ssh/id_rsa
          - pubkey: /root/.ssh/id_rsa.pub
  minion:
    master: opensourcewebsite.org
    schedule:
      - highstate:
        - function: state.apply
        - minutes: 100000

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
