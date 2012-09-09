if defined? SidekiqScheduler
  require 'yaml'
  require 'sidekiq'
  require 'sidekiq-scheduler'

  Sidekiq.schedule = YAML.load(File.open("#{Rails.root}/config/sidekiq.yml"))["schedule"]
end
