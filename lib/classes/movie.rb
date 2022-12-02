require_relative 'item'

class Movie < Item
  attr_accessor :publish_date, :silent

  def initialize(publish_date:, silent:)
    super(publish_date: publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end

  def to_json(*args)
    {
      'type' => self.class,
      'id' => @id,
      'publish_date' => @publish_date,
      'silent' => @silent
    }.to_json(*args)
  end
end
