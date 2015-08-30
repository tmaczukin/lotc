shared_examples 'standard resolver' do
  it 'should have ability to add object into resolver' do
    expect { subject.call.add(:name, @object_to_add) }.to_not raise_error
  end

  it 'should raise error while duplicating name' do
    resolver = subject.call
    resolver.add(:name, @object_to_add)

    expect { resolver.add(:name, @object_to_add) }.to raise_error LOTC::DuplicatedNameError
  end

  it 'should have ability to check if object was added' do
    resolver = subject.call
    resolver.add(:name, @object_to_add)

    expect(resolver.contains?(:name)).to be true
    expect(resolver.contains?(:name_2)).to be false
  end

  it 'should raise error when adding object of invalid type' do
    resolver = subject.call

    expect { resolver.add(:name, LOTC::Manifest.new) }.to raise_error LOTC::InvalidObjectError
  end

  it 'should return added object' do
    resolver = subject.call
    resolver.add(:test, @object_to_add)

    expect(resolver.get(:test)).to eq(@object_to_add)
  end

  it 'should raise error when trying to get not added object' do
    expect { subject.call.get(:not_added) }.to raise_error LOTC::NotAddedObjectError
  end
end
