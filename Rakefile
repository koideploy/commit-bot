require 'rspec/core/rake_task'
require File.join(File.dirname(__FILE__), *%w(lib commit_bot))

desc 'Default: run specs.'
task :default => :spec

desc "Run specs"
RSpec::Core::RakeTask.new do |t|
  t.pattern = "./spec/**/*_spec.rb"
end

namespace :commit_bot do
  desc "Commit Random CC Flickr Photo"
  task :work do
    bot = CommitBot::Bot.new
    bot.work
  end
end
