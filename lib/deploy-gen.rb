require 'thor'
require 'deploy-gen/version'
require 'deploy-gen/deploy'
require 'deploy-gen/setup'

module DeployGen
  module Generator
    class All < Thor
      desc "deploy", "Generate deploy-related files"
      method_option 'name'
      method_option 'production-server-name'
      method_option 'staging-server-name'
      method_option 'no-rails', :default => false
      method_option 'set-real-ip-from'

      def deploy
        invoke DeployGen::Generator::Deploy
      end
    end
  end
end
