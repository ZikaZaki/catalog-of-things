require_relative 'item'

class Label
  attr_accessor :id, :title, :color, :items

  def initialize(title:, color:, id: Random.rand(1...1000), items: [])
    @id = id
    @title = title
    @color = color
    @items = items
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.label = self
  end

  def to_json(*args)
    {
      'id' => @id,
      'title' => @title,
      'color' => @color,
      'items' => @items
    }.to_json(*args) # this method will auto_convert to json
  end
end
