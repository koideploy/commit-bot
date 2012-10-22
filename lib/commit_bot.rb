require 'bundler/setup'
require 'flickr_fu'

Dir.glob(File.join(File.dirname(__FILE__), 'commit_bot', '*'), &method(:require))

module CommitBot
end
