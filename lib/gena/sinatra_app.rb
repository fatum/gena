require 'thor/group'
require 'gena/deploy/helpers'
require 'gena/sinatra_app/helpers'

module Gena
  module Generator
    class SinatraApp < Thor::Group
      include Thor::Actions
      include Gena::Generator::DeployHelpers
      include Gena::Generator::SinatraAppHelpers

      argument :name

      self.source_paths << File.join(File.dirname(__FILE__), '../../templates/sinatra')

      def ask_for_missing_options
        self.production_server_name = options['production-server-name'] ||
          ask_with_default("Production domain", "#{app_name_normalized}.production.purls.ru")
        self.staging_server_name = options['staging-server-name'] ||
          ask_with_default("Staging domain", "#{app_name_normalized}.staging.purls.ru")
        #self.set_real_ip_from = options['set-real-ip-from'] || ask_with_default("Set real ip from", false)
      end

      def nginx
        REGULAR_FILES.each do |file|
          template(file)
        end
        template "config/nginx/production.conf", "config/nginx/#{app_name_id}_production.conf"
        template "config/nginx/staging.conf", "config/nginx/#{app_name_id}_staging.conf"
      end

      DIRECTORIES = %w{
        log
        db
      }

      REGULAR_FILES = %w{
        README
        Gemfile
        Rakefile
        .gitignore
        .rspec
        config.ru
        app/application.rb
        config/settings.yml
        config/database.yml
        config/settings/development.yml
        config/settings/production.yml
        config/settings/staging.yml
        config/settings/test.yml
        config/application.rb
        spec/spec_helper.rb
        spec/app/application_spec.rb
      }

      def generate
        REGULAR_FILES.each do |file|
          template(file, app(file))
        end

        DIRECTORIES.each do |dir|
          empty_directory(app(dir))
        end
      end

      def bundle
        inside(name) do
          run('bundle install')
        end
      end

      def run_specs
        inside(name) do
          run('bundle exec rake')
        end
      end
    end
  end
end

