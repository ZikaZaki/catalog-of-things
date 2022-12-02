require 'json'
require './lib/classes/genre'
require './lib/classes/music_album'
require './lib/classes/label'
require './lib/classes/book'
require './lib/classes/author'
require './lib/classes/game'
require './app/helpers/items_builder'

module LoadData
  def self.load_genres
    path = File.expand_path('../..', __dir__).concat('/data/genres.json')
    if File.exist?(path)
      genres = JSON.parse(File.read(path)).map do |genre|
        Genre.new(id: genre['id'], name: genre['name'], items: ItemsBuilder.build(genre['items']))
      end
      genres.any? ? genres : []
    else
      []
    end
  end

  def self.load_music_albums
    path = File.expand_path('../..', __dir__).concat('/data/music_albums.json')
    if File.exist?(path)
      music_albums = JSON.parse(File.read(path)).map do |album|
        MusicAlbum.new(publish_date: album['publish_date'], on_spotify: album['on_spotify'])
      end
      music_albums.any? ? music_albums : []
    else
      []
    end
  end

  def self.load_labels
    path = File.expand_path('../..', __dir__).concat('/data/labels.json')
    if File.exist?(path)
      labels = JSON.parse(File.read(path)).map do |label|
        Label.new(
          id: label['id'], title: label['title'],
          color: label['color'], items: ItemsBuilder.build(label['items'])
        )
      end
      labels.any? ? labels : []
    else
      []
    end
  end

  def self.load_books
    path = File.expand_path('../..', __dir__).concat('/data/books.json')
    if File.exist?(path)
      books = JSON.parse(File.read(path)).map do |book|
        Book.new(
          publish_date: book['publish_date'],
          publisher: book['publisher'],
          cover_state: book['cover_state']
        )
      end
      books.any? ? books : []
    else
      []
    end
  end

  def self.load_authors
    path = File.expand_path('../..', __dir__).concat('/data/authors.json')
    if File.exist?(path)
      authors = JSON.parse(File.read(path)).map do |author|
        Author.new(
          id: author['id'], first_name: author['first_name'],
          last_name: author['last_name'], items: ItemsBuilder.build(author['items'])
        )
      end
      authors.any? ? authors : []
    else
      []
    end
  end

  def self.load_games
    path = File.expand_path('../..', __dir__).concat('/data/games.json')
    if File.exist?(path)
      games = JSON.parse(File.read(path)).map do |game|
        Game.new(
          publish_date: game['publish_date'],
          last_played_at: game['last_played_at'],
          multiplayer: game['multiplayer']
        )
      end
      games.any? ? games : []
    else
      []
    end
  end
end
