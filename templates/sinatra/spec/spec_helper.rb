ENV['RACK_ENV'] = 'test'

require File.dirname(__FILE__) + '/../app/application'

require 'rack/test'

def app
  @app ||= <%= app_class_name %>.new
end

RSpec.configure do |config|
end

