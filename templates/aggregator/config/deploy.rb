# -*- encoding : utf-8 -*-
set :application, "<%= app_name %>"

set :user, "service"
set :repository, "git@github.com:fatum/<%= app_name %>.git"

require 'deploy-recipes/deploy'
