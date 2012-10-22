module CommitBot
  class Bot
    attr_reader :repository

    def initialize
      @repository = Repository.new
    end
  end
end
