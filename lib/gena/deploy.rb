require 'thor/group'
require 'gena/deploy/helpers'

module Gena
  module Generator
    class Deploy < Thor::Group
      include Thor::Actions
      include Gena::Generator::DeployHelpers

      self.source_paths << File.join(File.dirname(__FILE__), '../../templates/deploy')

      def ask_for_missing_options
        self.production_server_name = options['production-server-name'] ||
          ask_with_default("Production domain", "#{app_name_normalized}.purls.ru")
        self.staging_server_name = options['staging-server-name'] ||
          ask_with_default("Staging domain", "#{app_name_normalized}.staging.purls.ru")
        #self.set_real_ip_from = options['set-real-ip-from'] || ask_with_default("Set real ip from", false)
      end

      def generate
        REGULAR_FILES.each do |file|
          template(file)
        end
        template "config/nginx/production.conf", "config/nginx/#{app_name_id}_production.conf"
        template "config/nginx/staging.conf", "config/nginx/#{app_name_id}_staging.conf"
      end

      def add_gems
        append_to_file 'Gemfile', "\n## Imported by gem 'gena'\n"
        append_to_file 'Gemfile', "gem 'sidekiq'\n"
        append_to_file 'Gemfile', "gem 'bootstrap_kaminari', :git => 'git://github.com/dleavitt/bootstrap_kaminari.git'\n"
        append_to_file 'Gemfile', "gem 'twitter-text', :git => 'git://github.com/twitter/twitter-text-rb.git'\n"
        append_to_file 'Gemfile', "gem 'aggregation-platform', git: 'git@github.com:fatum/aggregation-platform.git'\n"
        append_to_file 'Gemfile', "gem 'deploy-recipes', git: 'git@github.com:fatum/deploy-recipes.git'\n"
      end

      def capify
        run "bundle install --path=vendor/gems"
        run "bundle exec rake aggregation_platform_engine:install:migrations"
        run "bundle exec capify ."
      end

      REGULAR_FILES = %w{
        config/deploy/production.rb
        config/deploy/staging.rb
        config/deploy.rb
        config/sidekiq.yml
        config/schedule.rb
        config/unicorn.rb
        config/initializers/sidekiq.rb
        config/upstart/Procfile.production
        config/upstart/Procfile.staging
      }
    end
  end
end
