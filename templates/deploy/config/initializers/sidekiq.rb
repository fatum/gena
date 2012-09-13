require 'yaml'
require 'sidekiq'
require 'sidekiq-scheduler'

Sidekiq.configure_server do |config|
  config.redis = { :url => 'redis://localhost:6379/2', :namespace => 'applenews' }
end

if defined? Sidekiq.schedule
  Sidekiq.schedule = YAML.load(File.open("#{Rails.root}/config/sidekiq.yml"))["schedule"]
end
