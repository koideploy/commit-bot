module CommitBot
  class Repository
    LOCAL_PATH = '/tmp/koideploy-showcase'
    REPOSITORY = 'git@github.com:koideploy/showcase.git'
    CLONE_OPTIONS = {:quiet => true, :verbose => false, :progress => false, :branch => 'master'}

    def initialize
      clone
    end

    def pull
    end

    def clone
      Grit::Git.new('/tmp/stub').clone(CLONE_OPTIONS, REPOSITORY, LOCAL_PATH)
    end
  end
end
