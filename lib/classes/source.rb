class Source
  attr_reader :id, :items
  attr_accessor :name

  def initialize(name:, id: Random.rand(1...1000), items: [])
    @id = id
    @name = name
    @items = items
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.genre = self
  end

  def to_json(*args)
    {
      'id' => @id,
      'name' => @name,
      'items' => @items
    }.to_json(*args) # this method will auto_convert to json
  end
end
