require_relative 'item'

class Author
  attr_reader :id, :items
  attr_accessor :first_name, :last_name

  def initialize(first_name:, last_name:, id: Random.rand(1...1000), items: [])
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = items
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.author = self
  end

  def to_json(*args)
    {
      'id' => @id,
      'first_name' => @first_name,
      'last_name' => @last_name,
      'items' => @items
    }.to_json(*args) # this method will auto_convert to json
  end
end
