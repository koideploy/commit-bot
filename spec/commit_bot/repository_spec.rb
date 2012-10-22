require 'spec_helper'

describe CommitBot::Repository do
  context 'clone repository' do
    let(:clone_options) { {:quiet => true, :verbose => false, :progress => false, :branch => 'master'} }

    it 'clones the repository' do
      grit = mock(Object.new)
      grit.should_receive(:clone).with(clone_options, 'git@github.com:koideploy/showcase.git', '/tmp/koideploy-showcase')
      Grit::Git.stub(:new).and_return(grit)

      CommitBot::Repository.new
    end
  end
end
