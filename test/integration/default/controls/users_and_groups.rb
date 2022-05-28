# frozen_string_literal: true

control 'osw users' do
  title 'The required groups and users should be created'

  groups = %w[opensourcewebsite.org grandmotivator mycelium]
  users = %w[opensourcewebsite.org grandmotivator mycelium]

  groups.each do |g|
    describe group(g) do
      it { should exist }
    end
  end

  users.each do |u|
    describe user(u) do
      it { should exist }
    end
  end
end
