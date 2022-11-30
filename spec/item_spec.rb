require_relative '../classes/item'

describe Item do
    before :each do
      @item = Item.new("2010-01-01", false)
    end

    it "item date should be 2010-01-01" do
        expect(@item.publish_date).to eq("2010-01-01")
    end

    it "item should be an instance of Item" do
        expect(@item).to be_an_instance_of(Item)
    end

end  
