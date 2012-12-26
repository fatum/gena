require File.dirname(__FILE__) + '/../config/application'

class <%= app_class_name %> < Sinatra::Base
  get '/' do
    "<pre>Time is #{settings.db['SELECT TIME()'].first.inspect}</pre>"
  end
end

