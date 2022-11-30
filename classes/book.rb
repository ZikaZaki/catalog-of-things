require './classes/item'

class Book < Item
  attr_accessor :publish_date, :publisher, :cover_state

  def initialize(publisher, cover_state)
    super(publish_date, false)

    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end