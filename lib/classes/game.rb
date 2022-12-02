require 'date'
require_relative 'item'

class Game < Item
  attr_accessor :last_played_at, :multiplayer
  attr_reader :publish_date

  def initialize(publish_date:, last_played_at:, multiplayer:)
    super(publish_date: publish_date)
    @last_played_at = last_played_at
    @multiplayer = multiplayer
  end

  def can_be_archived?
    Date.today > Date.iso8601(@last_played_at).next_year(2) || super
  end

  def to_json(*args)
    {
      'type' => self.class,
      'id' => @id,
      'publish_date' => @publish_date,
      'last_played_at' => @last_played_at,
      'multiplayer' => @multiplayer
    }.to_json(*args)
  end
end
