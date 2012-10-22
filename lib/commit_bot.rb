require 'bundler/setup'
require 'grit'

Dir.glob(File.join(File.dirname(__FILE__), 'commit_bot', '*'), &method(:require))

module CommitBot
  LOCAL_PATH = '/tmp/koideploy-showcase'
  REPOSITORY = 'git@github.com:koideploy/showcase.git'
end
