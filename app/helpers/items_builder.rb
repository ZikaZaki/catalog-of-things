require './lib/classes/book'
require './lib/classes/music_album'
require './lib/classes/game'
require './lib/classes/movie'

module ItemsBuilder
  def self.build(items)
    rebuilt_items = []
    items.map do |item|
      case item['type'].downcase
      when 'book'
        rebuilt_items << Book.new(
          publish_date: item['publish_date'], publisher: item['publisher'], cover_state: item['cover_state']
        )
      when 'musicalbum'
        rebuilt_items << MusicAlbum.new(publish_date: item['publish_date'], on_spotify: item['on_spotify'])
      when 'game'
        rebuilt_items << Game.new(
          publish_date: item['publish_date'], last_played_at: item['last_played_at'],
          multiplayer: item['multiplayer']
        )
      when 'movie'
        rebuilt_items << Movie.new(publish_date: item['publish_date'], silent: item['silent'])
      end
    end
    rebuilt_items
  end
end
