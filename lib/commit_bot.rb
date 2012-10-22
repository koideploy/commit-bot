require 'bundler/setup'
require 'grit'

require File.join(File.expand_path(File.dirname(__FILE__)), *%w(commit_bot bot))

module CommitBot
  LOCAL_PATH = '/tmp/koideploy-showcase'
  REPOSITORY = 'git@github.com:koideploy/showcase.git'
end
