require File.join(File.expand_path(File.dirname(__FILE__)), *%w(.. .. lib commit_bot))

describe CommitBot::Bot do
  describe 'initialize' do
    subject { Commit::Bot.new }
    context 'clone repository' do
      let(:clone_options) { {:quiet => true, :verbose => false, :progress => false, :branch => 'master'} }

      it 'clones the repository' do
        grit = mock(Object.new)
        grit.should_receive(:clone).with(clone_options, 'git@github.com:koideploy/showcase.git', '/tmp/koideploy-showcase')
        Grit::Git.stub(:new).and_return(grit)

        CommitBot::Bot.new
      end
    end
  end
end
