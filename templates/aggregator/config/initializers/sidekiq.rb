require 'yaml'
require 'sidekiq'
require 'sidekiq-scheduler'

config = File.join AggregationPlatform.root, 'config/sidekiq.yml'
options = YAML.load File.open(config)

options[:namespace] = "<%= app_name %>_#{Rails.env}"

Sidekiq.options = options

# Sidekiq doesn't working with hash settings namespace
Sidekiq.redis = Sidekiq::RedisConnection.create(namespace: options[:namespace])

if defined? Sidekiq.schedule
  Sidekiq.schedule = options["schedule"]
end
