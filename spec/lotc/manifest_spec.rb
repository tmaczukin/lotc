# LOTC module
#
module LOTC
  describe Manifest do
    before do
      @manifest = Manifest.new
    end

    it 'should returns Image resolver' do
      expect(@manifest.images).to be_a Resolver::Image
    end

    it 'should returns Container resolver' do
      expect(@manifest.containers).to be_a Resolver::Container
    end

    it 'should returns Task resolver' do
      expect(@manifest.tasks).to be_a Resolver::Task
    end

    it 'should returns Deploy resolver' do
      expect(@manifest.deploys).to be_a Resolver::Deploy
    end

    it 'should returns Stage resolver' do
      expect(@manifest.stages).to be_a Resolver::Stage
    end

    it 'should returns Parameter resolver' do
      expect(@manifest.parameters).to be_a Resolver::Parameter
    end

    it 'should returns Stack resolver' do
      expect(@manifest.stacks).to be_a Resolver::Stack
    end

    it 'should set and return name' do
      @manifest.name = 'Name of this manifest'

      expect(@manifest.name).to eq('Name of this manifest')
    end

    it 'should set and return maintainers list' do
      maintainer_1 = 'Developer1 <developer.1@example.com>'
      maintainer_2 = 'Developer2 <developer.2@example.com>'

      @manifest.add_maintainer(maintainer_1)
      @manifest.add_maintainer(maintainer_2)

      expect(@manifest.maintainers.count).to eq(2)
      expect(@manifest.maintainers.first).to eq(maintainer_1)
    end
  end
end
