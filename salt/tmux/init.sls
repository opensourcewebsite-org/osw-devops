/etc/tmux.conf:
  file.managed:
    - source: salt://tmux/files/tmux.conf
    - user: root
    - group: root
    - mode: 644
