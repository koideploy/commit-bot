module CommitBot
  module Flickr
    extend self

    FLICKR_CONFIG_PATH = File.join(File.expand_path(File.dirname(__FILE__)), *%w(.. .. config flickr.yml))
    CREATIVE_COMMON_LICENSE_IDS = %w(1 2 3 4 5 6 7).join(',')

    def random_photo
      photos.sample
    end

    private

    def photos
      flickr_client.photos.search(:license => CREATIVE_COMMON_LICENSE_IDS, :sort => 'interestingness-desc')
    end

    def flickr_client
      Flickr.new(FLICKR_CONFIG_PATH)
    end
  end
end
