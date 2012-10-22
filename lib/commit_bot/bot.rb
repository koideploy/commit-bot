module CommitBot
  class Bot
    attr_reader :grit

    def initialize
      clone_repository
    end

    private

    def clone_repository
      @grit = Grit::Git.new('/tmp/stub')
      grit.clone({:quiet => true, :verbose => false, :progress => false, :branch => 'master'}, ::CommitBot::REPOSITORY, ::CommitBot::LOCAL_PATH)
      initialize_grit
    end

    def initialize_grit
      @grit = Grit::Git.new(::CommitBot::LOCAL_PATH)
    end
  end
end
