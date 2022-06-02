# frozen_string_literal: true

control 'osw services (enabled)' do
  title 'The services should be installed, enabled and running'

  services = %w[cron auditd rsyslog nginx php7.4-fpm supervisor exim4]

  services.each do |s|
    describe service(s) do
      it { should be_installed }
      it { should be_enabled }
      it { should be_running }
    end
  end
end

control 'osw services (disabled)' do
  title 'The services should be installed, but not enabled nor running'

  services = %w[git-auto-deploy]

  services.each do |s|
    describe service(s) do
      it { should be_installed }
      it { should_not be_enabled }
      it { should_not be_running }
    end
  end
end
