set :ssh_options, {:forward_agent => true, :keys => %w{~/.ssh/id_rsa}}
set :rails_env, "staging"

role :app, "#{user}@5.9.90.15", primary: true
role :web, "#{user}@5.9.90.15", primary: true
role :db, "#{user}@5.9.90.15", primary: true

set :deploy_to, "/srv/staging/#{application}"
