require 'thor'
require 'gena/version'
require 'gena/deploy'
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

      desc "deploy", "Generate deploy-related files"
      method_option 'name'
      method_option 'production-server-name'
      method_option 'staging-server-name'
      method_option 'no-rails', :default => false
      #method_option 'set-real-ip-from'

      def deploy
        invoke Gena::Generator::Deploy
      end
    end
  end
end
