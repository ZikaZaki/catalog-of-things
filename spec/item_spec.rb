require './lib/classes/item'

describe Item do
  before :each do
    @item = Item.new(publish_date: '2020-10-21')
  end

  it 'item should be an instance of Item' do
    expect(@item).to be_an_instance_of(Item)
  end

  it 'item should have a publish_date' do
    expect(@item.publish_date.strftime('%Y-%m-%d')).to eq('2020-10-21')
  end

  it 'item should have a id' do
    expect(@item.id).to be_an_instance_of(Integer)
  end

  it 'item can be archived' do
    expect(@item.archived).to be false
  end
end
