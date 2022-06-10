# frozen_string_literal: true

control 'osw packages' do
  title 'The required packages should be installed'

  pkgs =
    case platform[:release]
    when '18.04'
      %w[git-auto-deploy]
    else
      %w[]
    end

  pkgs += %w[debconf-utils exim4 openssh-server nmap tcpdump ioping ethtool hdparm lsof
             strace mc htop sysstat lshw iotop iftop sudo tmux chrony
             update-notifier-common unattended-upgrades update-manager-core
             software-properties-common python3-software-properties python-apt
             python-pycurl certbot python3-certbot-nginx python3-certbot-dns-cloudflare
             python3-pygit2 landscape-common ccze python3.7 apache2-utils php-xdebug
             php7.4-soap php7.4-bcmath cron auditd audispd-plugins rsyslog acl nginx
             openssl php7.4-fpm php7.4-zip php7.4-mbstring php7.4-gd php-imagick
             php7.4-intl php7.4-curl php7.4-mysql php7.4-cli php7.4-xml supervisor
             python3-pip composer logrotate]

  pkgs.each do |p|
    describe package(p) do
      it { should be_installed }
    end
  end
end

control 'osw pip packages' do
  title 'The required pip packages should be installed'

  pkgs = %w[superlance]

  pkgs.each do |p|
    describe pip(p, '/usr/bin/pip3') do
      it { should be_installed }
    end
  end
end
