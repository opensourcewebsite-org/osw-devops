auto-update:
  file.line:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - mode: replace
    - content: 'APT::Periodic::Update-Package-Lists "0";'
    - match: 'APT::Periodic::Update-Package-Lists "1";'
    
auto-upgrade:
  file.line:
    - name: /etc/apt/apt.conf.d/20auto-upgrades
    - mode: replace
    - content: 'APT::Periodic::Unattended-Upgrade "0";'
    - match: 'APT::Periodic::Unattended-Upgrade "1";'
