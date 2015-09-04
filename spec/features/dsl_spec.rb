describe 'Features' do
  describe 'DSL' do
    subject do
      -> { LOTC::Manifest.new(manifest_contents) }
    end

    before do
      skip('Waiting for DSL implementation')
    end

    context 'when manifest content is valid' do
      let(:manifest_contents) { fulle_manifest_example }

      it 'loads manifest without raising error' do
        expect { subject.call }.to_not raise_error
      end

      it 'returns Manifest object' do
        expect(subject.call).to be_a Manifest
      end
    end

    context 'when manifest content is invalid' do
      let(:manifest_contents) { 'invalid_method' }

      it 'raises error when loading manifest' do
        expect { subject.call }.to raise_error InvalidManifestError
      end
    end
  end
end
