require './lib/classes/label'

describe Label do
  before :each do
    @label = Label.new(title: 'Label 1', color: 'red')
  end

  it 'label title should be Label 1' do
    expect(@label.title).to eq('Label 1')
  end

  it 'label color should be red' do
    expect(@label.color).to eq('red')
  end

  it 'label should be an instance of Label' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'label should have 0 items' do
    expect(@label.items.length).to eq(0)
  end
end
