shared_examples 'builder' do
  it 'should build object of valid type' do
    expect(subject.call.build).to be_a(@builded_type)
  end
end
