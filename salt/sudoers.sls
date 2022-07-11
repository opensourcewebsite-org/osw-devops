/etc/sudoers.d/custom:
  file.managed:
    - mode: 440
    - content: Defaults !mail_no_user
    - check_cmd: /usr/sbin/visudo -cf
    - require:
      - pkg: sudo
