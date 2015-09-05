shared_examples 'building resolver' do
  context 'when name was already used' do
    it 'raises error while adding builder' do
      resolver = subject.call
      resolver.add_builder(:name, builder_to_add)

      expect { resolver.add_builder(:name, builder_to_add) }.to raise_error LOTC::DuplicatedNameError
    end
  end

  context 'when builder has invalid type' do
    it 'raises error while adding builder' do
      expect { subject.call.add_builder(:name, LOTC::Manifest.new) }.to raise_error LOTC::InvalidBuilderError
    end
  end

  context 'when name was not used' do
    it 'raises error while getting builder' do
      expect { subject.call.get_builder(:not_added) }.to raise_error LOTC::NotAddedBuilderError
    end
  end

  it 'returns added builder' do
    resolver = subject.call
    resolver.add_builder(:test, builder_to_add)

    expect(resolver.get_builder(:test)).to eq(builder_to_add)
  end

  it 'returns added builders count' do
    resolver = subject.call
    resolver.add_builder(:test, builder_to_add)

    expect(resolver.count_builders).to be > 0
  end

  describe '#contains_builder?' do
    let(:resolver) do
      resolver = subject.call
      resolver.add_builder(:name, builder_to_add)
      resolver
    end

    context 'when builder was added' do
      it 'returns true' do
        expect(resolver.contains_builder?(:name)).to be true
      end
    end

    context 'when builder was not added' do
      it 'returns false' do
        expect(resolver.contains_builder?(:name_2)).to be false
      end
    end
  end

  context 'when named builder was added but named object was not' do
    it 'builds and returns builded object' do
      resolver = subject.call
      resolver.add_builder(:object_to_build, builder_to_add)

      expect(resolver.get(:object_to_build)).to be_a(object_type)
    end
  end
end
