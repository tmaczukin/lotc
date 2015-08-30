shared_examples 'building resolver' do
  it 'should have ability to add builder object into resolver' do
    expect { subject.call.add_builder(:name, @builder_to_add) }.to_not raise_error
  end

  it 'should raise exception while duplicating name' do
    resolver = subject.call
    resolver.add_builder(:name, @builder_to_add)

    expect { resolver.add_builder(:name, @builder_to_add) }.to raise_error LOTC::DuplicatedNameError
  end

  it 'should have ability to check if builder object was added' do
    resolver = subject.call
    resolver.add_builder(:name, @builder_to_add)

    expect(resolver.contains_builder?(:name)).to be true
    expect(resolver.contains_builder?(:name_2)).to be false
  end

  it 'should raise error when adding builder of invalid type' do
    resolver = subject.call

    expect { resolver.add_builder(:name, LOTC::Manifest.new) }.to raise_error LOTC::InvalidBuilderError
  end

  it 'should return added builder' do
    resolver = subject.call
    resolver.add_builder(:test, @builder_to_add)

    expect(resolver.get_builder(:test)).to eq(@builder_to_add)
  end

  it 'should raise error when trying to get not added builder' do
    expect { subject.call.get_builder(:not_added) }.to raise_error LOTC::NotAddedBuilderError
  end

  it 'should build and return builded object when named builder exists but named object was not added' do
    resolver = subject.call
    resolver.add_builder(:object_to_build, @builder_to_add)

    expect(resolver.get(:object_to_build)).to be_a(@object_type)
  end
end
