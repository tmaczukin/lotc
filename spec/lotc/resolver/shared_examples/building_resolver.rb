shared_examples 'building resolver' do
  it 'should have ability to add builder object into resolver' do
    expect { subject.call.add_builder(:name, @builder_to_add) }.to_not raise_error
  end

  it 'should raise exception while duplicating name' do
    resolver = subject.call
    resolver.add_builder(:name, @builder_to_add)

    expect { resolver.add_builder(:name, @builder_to_add) }.to raise_error LOTC::DuplicatedNameError
  end

  it 'should have abiliti to check if builder object was added' do
    resolver = subject.call
    resolver.add_builder(:name, @builder_to_add)

    expect(resolver.contains_builder?(:name)).to be true
    expect(resolver.contains_builder?(:name_2)).to be false
  end

  it 'should raise error when adding builder of invalid type' do
    resolver = subject.call

    expect { resolver.add_builder(:name, LOTC::Manifest.new) }.to raise_error LOTC::InvalidBuilderError
  end
end
