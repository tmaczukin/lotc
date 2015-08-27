describe 'Features' do
  describe 'DSL' do
    subject do
      -> { LOTC::Manifest.new(@manifest_contents) }
    end

    before do
      @manifest_contents = full_manifest_example
    end

    it 'should load valid manifest content without raising error' do
      expect { subject.call }.to_not raise_error
    end

    it 'should raise error when loading invalid manifest' do
      @manifest_contents = 'invalid_method'
      expect { subject.call }.to raise_error InvalidManifestError
    end

    it 'should return Manifest object' do
      expect(subject.call).to be_a Manifest
    end
  end
end
