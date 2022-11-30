class Label
    attr_accessor :id, :title, :color, :items
    
    def initialize(title, color)
        @id = Random.rand(1000)
        @title = title
        @color = color
        @items = []
    end

    def add_item(item)
        @items << item
        item.label = self

    end

end


chriatian = Label.new("Christian", "red")
chriatian.color

chriatian.add_item("book")
chriatian.add_item("book2")
puts chriatian.items


