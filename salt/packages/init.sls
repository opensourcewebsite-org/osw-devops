packages:
  pkg.installed:
    - pkgs:
    #  - openssh-server
    #  - nmap
    #  - tcpdump
    #  - ioping
    #  - ethtool
    #  - hdparm
    #  - lsof
    #  - strace
    #  - mc
    #  - htop
    #  - sysstat
    #  - lshw
    #  - iotop
    #  - iftop
    #  - sudo
      - tmux
      - python-pip
      - chrony
    #  - update-notifier-common
    #  - unattended-upgrades
      #- update-manager-core
      - software-properties-common
      #- python-apt
      - python-pycurl
      - certbot
      - python-certbot-nginx
      - python3-certbot-nginx
      - python3-certbot-dns-cloudflare
      - python3-pygit2
      - landscape-common
      - ccze
      - python3.7

#NAME:
#  pkg.purged
