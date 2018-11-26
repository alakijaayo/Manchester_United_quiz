describe Number do
  it 'starts counting' do
    expect(subject.question).to eq 0
  end

  it 'adds a number to the count' do
    subject.add
    expect(subject.question).to eq 1
  end
end
