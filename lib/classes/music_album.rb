require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify

  def initialize(publish_date:, on_spotify:)
    super(publish_date: publish_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super && @on_spotify
  end

  def to_json(*args)
    {
      'type' => self.class,
      'id' => @id,
      'publish_date' => @publish_date,
      'on_spotify' => @on_spotify
    }.to_json(*args)
  end
end
