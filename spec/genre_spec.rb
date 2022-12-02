require './lib/classes/genre'
require './lib/classes/music_album'

describe Genre do
  it 'has a name' do
    genre = Genre.new(name: 'ZikaZaki')
    expect(genre.name).to eq('ZikaZaki')
  end

  it 'genre has a music_album' do
    album = MusicAlbum.new(publish_date: '2022-12-02', on_spotify: true)
    genre = Genre.new(name: 'ZikaZaki')
    genre.add_item(album)
    expect(genre.items.include?(album)).to eq(true)
  end
end
