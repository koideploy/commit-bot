module CommitBot
  class Repository
    LOCAL_PATH = '/tmp/koideploy-showcase'
    REPOSITORY = 'git@github.com:koideploy/showcase.git'

    def initialize
      clone
    end

    def pull
      execute_in_working_dir 'git pull'
    end

    def push
      execute_in_working_dir 'git push'
    end

    def commit(photo)
      execute_in_working_dir 'git add config/flickr_photo.yml'
      execute_in_working_dir "git commit -m '#{commit_message(photo)}'"
    end

    def clone
      unless File.exists?(LOCAL_PATH)
        `cd /tmp && git clone #{REPOSITORY} koideploy-showcase`
      end
    end

    private

    def commit_message(photo)
      "Display photo \"#{photo.title[0..40]}\" from \"#{photo.owner_username}\""
    end

    def execute_in_working_dir(command)
      `cd #{LOCAL_PATH} && #{command}`
    end
  end
end
