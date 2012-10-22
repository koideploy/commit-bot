require 'bundler/capistrano'
require 'capistrano_colors'

set :server_name, 'norbert.odindutton.com'
set :user, 'koideploy-showcase'
set :application, 'commit-bot'
set :environment, 'production'
set(:deploy_to) { "~/apps/#{application}/#{environment}" }
set :normalize_asset_timestamps, false

set :scm, :git
set :repository, "git@github.com:koideploy/commit-bot.git"
set :branch, "master"

ssh_options[:forward_agent] = true
set :use_sudo, false

set :whenever_command, 'bundle exec whenever'
set(:whenever_identifier) { "#{application}-#{environment}" }
set :whenever_roles, :app
require 'whenever/capistrano'

role :app, server_name

before 'deploy:finalize_update' do
  run "ln -nfs #{shared_path}/config/* #{release_path}/config/"
end
