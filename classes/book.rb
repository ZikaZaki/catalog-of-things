require './classes/item.rb'

class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date, false)

    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == "bad"
  end
end

book1 = Book.new("publisher1", "good")
book2 = Book.new("publisher2", "bad")

puts book1.can_be_archived?
