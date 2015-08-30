shared_examples 'standard resolver' do
  it 'should have ability to add object into resolver' do
    expect { subject.call.add(:name, :object) }.to_not raise_error
  end

  it 'should raise exception while duplicating name' do
    resolver = subject.call
    resolver.add(:name, :object_1)

    expect { resolver.add(:name, :object_2) }.to raise_error LOTC::DuplicatedNameError
  end

  it 'should have abiliti to check if object was added' do
    resolver = subject.call
    resolver.add(:name, :object_1)

    expect(resolver.contains?(:name)).to be true
    expect(resolver.contains?(:name_2)).to be false
  end
end
