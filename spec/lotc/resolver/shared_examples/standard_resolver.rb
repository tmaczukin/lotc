shared_examples 'standard resolver' do
  context 'when name was already used' do
    it 'raises error while adding object' do
      resolver = subject.call
      resolver.add(:name, object_to_add)

      expect { resolver.add(:name, object_to_add) }.to raise_error LOTC::DuplicatedNameError
    end
  end

  context 'when object has invalid type' do
    it 'raises error while adding object' do
      expect { subject.call.add(:name, LOTC::Manifest.new) }.to raise_error LOTC::InvalidObjectError
    end
  end

  context 'when name was not used' do
    it 'raises error while getting object' do
      expect { subject.call.get(:not_added) }.to raise_error LOTC::NotAddedObjectError
    end
  end

  it 'returns added object' do
    resolver = subject.call
    resolver.add(:test, object_to_add)

    expect(resolver.get(:test)).to eq(object_to_add)
  end

  describe '#contains?' do
    let(:resolver) do
      resolver = subject.call
      resolver.add(:name, object_to_add)
      resolver
    end

    context 'when object was added' do
      it 'returns true' do
        expect(resolver.contains?(:name)).to be true
      end
    end

    context 'when object was not added' do
      it 'returns false' do
        expect(resolver.contains?(:name_2)).to be false
      end
    end
  end
end
