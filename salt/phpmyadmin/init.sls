pma_utils:
  pkg.installed:
    - name: debconf-utils
    - order: 1

phpmyadmin_packages:
  pkg.installed:
    - pkgs:
      - phpmyadmin
    - require:
      - debconf: phpmyadmin_config
    - order: 2

phpmyadmin_setup:
  debconf.set:
    - name: phpmyadmin_config
    - data:
        'phpmyadmin/internal/skip-preseed': {'type': 'boolean', 'value': 'true' }
        'phpmyadmin/reconfigure-webserver': {'type': 'multiselect', 'value': '' }
        'phpmyadmin/dbconfig-install': {'type': 'boolean', 'value': 'false' }
    - require:
      - pkg: debconf-utils
