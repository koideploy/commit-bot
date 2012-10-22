require 'spec_helper'

describe CommitBot::Flickr do
  describe 'random photo' do
    let(:cc_license_ids) { "1,2,3,4,5,6,7" }
    let(:sort_order) { 'interestingness-desc' }
    let(:search_options) { {:license => cc_license_ids, :sort => sort_order} }

    before do
      flickr_client = stub(Object.new)
      search = mock(Object.new)
      flickr_client.stub(:photos).and_return(search)
      search.should_receive(:search).with(search_options).and_return([1,2])
      CommitBot::Flickr.stub(:flickr_client).and_return(flickr_client)
    end

    it 'returns a random result' do
      CommitBot::Flickr.random_photo.should satisfy {|n| [1,2].include?(n) }
    end
  end
end
