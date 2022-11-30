require_relative '../classes/label'

describe Label do
  before :each do
    @label = Label.new('Label 1', 'red')
  end

  it 'label title should be Label 1' do
    expect(@label.title).to eq('Label 1')
  end

  it 'label should be an instance of Label' do
    expect(@label).to be_an_instance_of(Label)
  end

  it 'label should have 0 items' do
    expect(@label.items.length).to eq(0)
  end
end
