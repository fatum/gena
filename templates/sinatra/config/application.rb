env = ENV['RACK_ENV'] || 'development'

require 'bundler'
Bundler.require(:default, env)

require 'sinatra/config_file'
CONFIG_ROOT = File.dirname(__FILE__)

class <%= app_class_name %> < Sinatra::Base
  register Sinatra::ConfigFile
  set :environments, %w{development test production staging}
  config_file "#{CONFIG_ROOT}/database.yml", "#{CONFIG_ROOT}/settings.yml", "#{CONFIG_ROOT}/settings/#{environment}.yml"
 
  set :db, Sequel.connect(db_conf)
  set :logging, true
end
