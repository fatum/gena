require 'bundler'

module Gena
  module Generator
    module DeployHelpers
      attr_accessor :production_server_name
      attr_accessor :staging_server_name
      attr_accessor :set_real_ip_from

      def use_rails?
         !options['no_rails'] || options['no_rails'].empty?
      end

      def app_name
        @app_name ||= options[:name] || File.basename(destination_root)
      end

      def app_name_normalized
        @app_name_normalized ||= app_name.gsub(/[^\w-]/, '-').gsub(/[\-_]+/, '-').gsub(/\A-/, '').gsub(/-\z/, '')
      end

      def app_name_id
        @app_name_id ||= app_name_normalized.gsub('-', '_')
      end

      def ask_with_default(question, default)
        answer = ask("#{question} (#{default}):")
        answer = default if answer.empty?
        puts "Set to: #{answer}"
        answer
      end

      def need_asset_pipeline_tasks?
        !options['no-rails'] && rails_version && rails_version >= Gem::Version.new('3.1')
      end

      def rails_version
        @rails_version ||= detect_rails_version
      end

      def detect_rails_version
        gemfile_path = File.join(destination_root, 'Gemfile.lock')
        return unless File.exist?(gemfile_path)
        lockfile_contents = Bundler.read_file(gemfile_path)
        locked = Bundler::LockfileParser.new(lockfile_contents)
        rails_dep = locked.dependencies.select{|d| d.name == 'rails'}.first
        return unless rails_dep
        # take first requirement, since .lock requirement is always '=' and singular for each gem
        req_type, version = rails_dep.requirement.requirements.first
        version
      rescue StandardError => e
        STDERR.puts "Couldn't parse Gemfile.lock: #{e}"
      end
    end
  end
end
