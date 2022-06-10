# frozen_string_literal: true

control 'osw files' do
  title 'Verify the configuration files'

  files =
    case platform[:release]
    when '18.04'
      # rubocop:disable Layout/SpaceInsideArrayPercentLiteral,Layout/LineLength,Style/TrailingCommaInArrayLiteral
      [%w[/etc/git-auto-deploy-opensourcewebsite.org.conf.json             git-auto-deploy       git-auto-deploy       0644],]
      # rubocop:enable Layout/SpaceInsideArrayPercentLiteral,Layout/LineLength,Style/TrailingCommaInArrayLiteral
    else
      []
    end

  # rubocop:disable Layout/SpaceInsideArrayPercentLiteral,Layout/LineLength,Style/TrailingCommaInArrayLiteral
  #    FILENAME                                                         OWNER                 GROUP                 MODE
  files += [
    %w[/etc/tmux.conf                                                   root                  root                  0644],
    %w[/etc/audit/rules.d/cis.rules                                     root                  root                  0600],
    %w[/etc/systemd/system/auditd.service                               root                  root                  0600],
    %w[/etc/rsyslog.d/auditd.conf                                       root                  root                  0400],
    %w[/etc/update-motd.d/10-help-text                                  root                  root                  0644],
    %w[/www/opensourcewebsite.org/.ssh/id_rsa                           root                  root                  0600],
    %w[/root/.selected_editor                                           root                  root                  0644],
    %w[/etc/nginx/nginx.conf                                            root                  root                  0644],
    %w[/etc/nginx/sites-available/supervisor                            root                  root                  0644],
    %w[/etc/nginx/sites-enabled/supervisor                              root                  root                  0644],
    %w[/etc/nginx/sites-available/opensourcewebsite.org                 root                  root                  0644],
    %w[/etc/nginx/sites-enabled/opensourcewebsite.org                   root                  root                  0644],
    %w[/etc/nginx/ssl/dhparam.pem                                       root                  root                  0644],
    %w[/etc/letsencrypt/live/opensourcewebsite.org/privkey.pem          root                  root                  0644],
    %w[/etc/letsencrypt/live/opensourcewebsite.org/fullchain.pem        root                  root                  0644],
    %w[/etc/nginx/nginx.pem                                             root                  root                  0644],
    %w[/etc/php/7.4/fpm/php.ini                                         root                  root                  0644],
    %w[/etc/php/7.4/fpm/php-fpm.conf                                    root                  root                  0644],
    %w[/etc/php/7.4/fpm/pool.d/opensourcewebsite.org.conf               root                  root                  0644],
    %w[/etc/php/7.4/fpm/pool.d/www.conf                                 root                  root                  0644],
    %w[/etc/php/7.4/cli/php.ini                                         root                  root                  0644],
    %w[/etc/supervisor/supervisord.conf                                 root                  root                  0644],
    %w[/etc/supervisor/conf.d/opensourcewebsite-gitautodeploy-8005.conf root                  root                  0644],
    %w[/etc/supervisor/conf.d/opensourcewebsite-cron.conf               root                  root                  0644],
    %w[/etc/supervisor/conf.d/_inet-supervisor.conf                     root                  root                  0644],
    %w[/etc/supervisor/conf.d/_fatal-mail-batch.conf                    root                  root                  0644],
    %w[/www/opensourcewebsite.org/htdocs/runtime/logs/cron-stdout.log   opensourcewebsite.org opensourcewebsite.org 0644],
    %w[/www/opensourcewebsite.org/htdocs/runtime/logs/cron-stderr.log   opensourcewebsite.org opensourcewebsite.org 0644],
    %w[/www/opensourcewebsite.org/.config/composer/composer.json        opensourcewebsite.org opensourcewebsite.org 0644],
    %w[/root/backup_mysql.sh                                            root                  root                  0700],
    %w[/root/backup_site.sh                                             root                  root                  0700],
    %w[/etc/logrotate.conf                                              root                  root                  0644],
    %w[/etc/logrotate.d/syslog                                          root                  root                  0644],
    %w[/etc/logrotate.d/rsyslog                                         root                  root                  0644],
    %w[/etc/logrotate.d/dpkg                                            root                  root                  0644],
    %w[/etc/logrotate.d/apt                                             root                  root                  0644],
    %w[/etc/logrotate.d/certbot                                         root                  root                  0644],
    %w[/etc/logrotate.d/nginx                                           root                  root                  0644],
    %w[/etc/logrotate.d/php7.4-fpm                                      root                  root                  0644],
    %w[/etc/logrotate.d/salt-common                                     root                  root                  0644],
    %w[/etc/logrotate.d/unattended-upgrades                             root                  root                  0644],
    %w[/etc/logrotate.d/opensourcewebsite.org                           root                  root                  0644],
    %w[/etc/logrotate.d/php-fpm-slow                                    root                  root                  0644],
    %w[/etc/exim4/dkim/opensourcewebsite.org.key                        Debian-exim           Debian-exim           0600],
    %w[/etc/exim4/dkim/opensourcewebsite.org.public                     Debian-exim           Debian-exim           0644],
  ]
  # rubocop:enable Layout/SpaceInsideArrayPercentLiteral,Layout/LineLength,Style/TrailingCommaInArrayLiteral

  files.each do |f|
    filename, owned_by, grouped_into, mode = f
    describe file(filename) do
      it { should be_file }
      it { should be_owned_by owned_by }
      it { should be_grouped_into grouped_into }
      its('mode') { should cmp mode }
    end
  end
end
