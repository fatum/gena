require 'thor'
require 'gena/version'
require 'gena/aggregator'
require 'gena/sinatra_app'
require 'gena/goliath'

module Gena
  module Generator
    class All < Thor
      desc "sinatra_app APPNAME", "Generate a Sinatra app skeleton"
      def sinatra_app(name)
        invoke Gena::Generator::SinatraApp
      end

      desc "goliath APPNAME", "Generate a Goliath app skeleton"
      def goliath(name)
        invoke Gena::Generator::Goliath
      end

      desc "aggregator APPNAME", "Generate aggregator-related deploy files"
      method_option 'name'
      method_option 'production-server-name'
      method_option 'staging-server-name'
      method_option 'no-rails', :default => false

      def aggregator
        invoke Gena::Generator::Aggregator
      end
    end
  end
end
