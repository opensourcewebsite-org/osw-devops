# frozen_string_literal: true

control 'osw services (enabled)' do
  title 'The services should be installed, enabled and running'

  services = %w[cron auditd rsyslog nginx php8.2-fpm supervisor exim4]

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

  only_if('`git-auto-deploy` only installed on `18.04`') do
    %w[18.04].include?(platform[:release])
  end

  services = %w[git-auto-deploy]

  services.each do |s|
    describe service(s) do
      it { should be_installed }
      it { should_not be_enabled }
      it { should_not be_running }
    end
  end
end
