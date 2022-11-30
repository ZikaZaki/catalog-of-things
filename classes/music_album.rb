require_relative 'item'

class MusicAlbum < Item
  attr_accessor :publish_date, :on_spotify

  def initialize(publish_date, on_spotify)
    super(publish_date)
    @on_spotify = on_spotify
  end

  def can_be_achieved?
    super && @on_spotify
  end
end
