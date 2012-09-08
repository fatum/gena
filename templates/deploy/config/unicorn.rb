# -*- encoding : utf-8 -*-
# bundle exec unicorn_rails -c config/unicorn.rb -D

rails_env = ENV['RAILS_ENV'] || 'production'
worker_processes (rails_env == 'production' ? 4 : 2)

APP_PATH = "/srv/projects/<%= app_name %>"
CURRENT = File.join(APP_PATH, 'current')
SHARED = File.join(APP_PATH, 'shared')

working_directory CURRENT
listen "#{CURRENT}/tmp/sockets/unicorn.sock", :backlog => 2048
pid "#{SHARED}/pids/unicorn.pid"
stderr_path "#{SHARED}/log/unicorn.log"
stdout_path "#{SHARED}/log/unicorn.log"
