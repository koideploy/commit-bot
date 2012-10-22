require 'bundler/capistrano'
require 'capistrano_colors'

set :server_name, ''
set :user, ''
set :application, 'commit-bot'
set(:deploy_to) { "~/" }

set :scm, :git
set :repository, "git@github.com:koideploy/showcase.git"
set :branch, "master"

ssh_options[:forward_agent] = true
set :use_sudo, false

set :whenever_command, 'bundle exec whenever'
set(:whenever_identifier) { "#{application}-#{rails_env}" }
require 'whenever/capistrano'

role :app, server_name
