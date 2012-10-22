module CommitBot
  class Bot
    attr_reader :repository

    def initialize
      @repository = Repository.new
    end

    def work
      repository.pull
      photo = Flickr.random_photo
      write_photo(photo)
      repository.commit(photo)
      repository.push
    end

    def write_photo(photo)
      File.open(File.join(Repository::LOCAL_PATH, *%w(config flickr_photo.yml)), 'w') do |file|
        YAML::dump(photo_to_hash(photo), file)
      end
    end

    private

    def photo_to_hash(photo)
      {
        :url => photo.url,
        :real_name => photo.owner_realname,
        :title => photo.title,
        :url_photopage => photo.url_photopage,
        :username => photo.owner_username,
        :taken_at => photo.taken_at,
        :license_name => photo.license.name,
        :license_url => photo.license.url
      }
    end
  end
end
