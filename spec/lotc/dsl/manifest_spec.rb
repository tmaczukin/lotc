# LOTC module
#
module LOTC
  describe DSL::Manifest do
    subject do
      dsl = DSL::Manifest.new(manifest_contents)
      dsl.get
    end

    context 'when manifest contents is invalid' do
      let(:manifest_contents) { 'invalid_method' }

      it { expect { subject }.to raise_error }
    end

    context 'when manifest contents is valid' do
      let(:manifest_contents) { '' }

      it 'returns manifest object' do
        expect(subject).to be_a(LOTC::Manifest)
      end
    end

    context 'when name is present' do
      let(:manifest_contents) { 'name :basic_manifest' }

      it 'sets name into manifest' do
        expect(subject.name).to eq(:basic_manifest)
      end
    end

    context 'when maintainers are present' do
      let(:manifest_contents) do
        <<-END
          maintainers 'Developer 1 <developer.1@example.com>',
                      'Developer 2 <developer.2@example.com>'
        END
      end

      it 'sets maintainers list' do
        maintainers = subject.maintainers

        expect(maintainers.count).to eq 2
        expect(maintainers).to include('Developer 1 <developer.1@example.com>')
      end
    end

    context 'when images are present' do
      let(:manifest_contents) do
        <<-END
          image :image_1, 'image_name', 'v0.1' 
          image :image_2, 'image2_name', 'latest'
        END
      end

      it 'instantiate images' do
        images = subject.images

        expect(images.count).to eq 2
        expect(images.get(:image_1)).to be_a(LOTC::Image)
      end
    end

    context 'when parameters are present' do
      let(:manifest_contents) do
        <<-END
          param :param_1, 'value 1'
          param :param_2, 'value 2'
        END
      end

      it 'instantiate parameters' do
        params = subject.parameters

        expect(params.count).to eq 2
        expect(params.get(:param_1)).to be_a(LOTC::Parameter)
      end
    end

    context 'when stacks are present' do
      it 'instantiate stacks' do
        skip('Waiting for containers DSL implementation')
      end
    end

    context 'when containers are present' do
      it 'instantiate container builders' do
        skip('Waiting for containers DSL implementation')
      end
    end

    context 'when stages are present' do
      it 'instantiate stage builders' do
        skip('Waiting for stages DSL implementation')
      end
    end

    context 'when tasks are present' do
      it 'instantiate task builders' do
        skip('Waiting for tasks DSL implementation')
      end
    end

    context 'when deploys are present' do
      it 'instantiate deploy builders' do
        skip('Waiting for deploys DSL implementation')
      end
    end
  end
end
