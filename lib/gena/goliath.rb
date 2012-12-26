require 'thor/group'
require 'gena/deploy/helpers'

module Gena
  module Generator
    class Goliath < Thor::Group
      include Thor::Actions

      self.source_paths << File.join(File.dirname(__FILE__), '../../templates/sinatra')

      def ask_for_missing_options
        self.production_server_name = options['production-server-name'] ||
          ask_with_default("Production domain", "#{app_name_normalized}.production.purls.ru")
        self.staging_server_name = options['staging-server-name'] ||
          ask_with_default("Staging domain", "#{app_name_normalized}.staging.purls.ru")
        #self.set_real_ip_from = options['set-real-ip-from'] || ask_with_default("Set real ip from", false)
      end

      def generate
      end
    end
  end
end
