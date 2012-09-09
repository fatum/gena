require 'thor'
require 'gena/version'
require 'gena/deploy'
require 'gena/setup'

module Gena
  module Generator
    class All < Thor
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
