shared_examples 'builder' do
  it 'builds object of valid type' do
    expect(subject.build).to be_a(builded_type)
  end
end
