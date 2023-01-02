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
             software-properties-common python3-software-properties python3-apt
             python3-pycurl certbot python3-certbot-nginx python3-certbot-dns-cloudflare
             python3-pygit2 landscape-common ccze python3.7 apache2-utils php-xdebug
             php8.2-soap php8.2-bcmath cron auditd audispd-plugins rsyslog acl nginx
             openssl php8.2-fpm php8.2-zip php8.2-mbstring php8.2-gd php-imagick
             php8.2-intl php8.2-curl php8.2-mysql php8.2-cli php8.2-xml supervisor
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
