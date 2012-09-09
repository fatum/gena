require 'yaml'
require 'sidekiq'
require 'sidekiq-scheduler'

if defined? SidekiqScheduler
  Sidekiq.configure_server do |config|
    config.redis = { :url => 'redis://localhost:6379/0', :namespace => '<%= app_name %>' }
  end

  Sidekiq.schedule = YAML.load(File.open("#{Rails.root}/config/sidekiq.yml"))["schedule"]
end
