require 'bundler/setup'
require 'grit'
require 'flickr_fu'

Dir.glob(File.join(File.dirname(__FILE__), 'commit_bot', '*'), &method(:require))

module CommitBot
end
