# frozen_string_literal: true

control 'osw cron entries' do
  title 'The cron entries should be present'

  cron_entries = ['^\d{1,2} 1 \* \* \* /root/backup_mysql.sh$',
                  '^\d{1,2} 2 \* \* \* /root/backup_site.sh$']

  cron_entries.each do |c|
    describe cron do
      its(:table) { should match(/(#{c})/) }
    end
  end
end
