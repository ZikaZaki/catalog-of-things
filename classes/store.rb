require 'json'
require_relative 'game'
require_relative 'book'
require_relative 'label'

module Store
  def save_book_data
    @books_collection = []
    @books.each do |book|
      @books_collection.push('publisher' => book.publisher, 'cover_state' => book.cover_state,
                             'publish_date' => book.publish_date)
    end
    File.write('books.json', JSON.pretty_generate(@books_collection))
  end

  def parse_book_data
    File.write('books.json', JSON.pretty_generate([])) unless File.exist?('books.json')
    JSON.parse(File.read('books.json')).map do |book|
      @books << Book.new(book['publisher'], book['cover_state'], book['publish_date'])
    end
  end

  def save_label_data
    @labels_collection = []
    @labels.each do |label|
      @labels_collection.push('title' => label.title, 'color' => label.color)
    end
    File.write('labels.json', JSON.pretty_generate(@labels_collection))
  end

  def parse_label_data
    File.write('labels.json', JSON.pretty_generate([])) unless File.exist?('labels.json')
    JSON.parse(File.read('labels.json')).map do |label|
      @labels << Label.new(label['title'], label['color'])
    end
  end

  def save_game_data
    @games_collection = []
    @games.each do |game|
      @games_collection.push('Last_played_at' => game.last_played_at, 'Multiplayer' => game.multiplayer,
                             'Publish_date' => game.publish_date)
    end
    File.write('game.json', JSON.pretty_generate(@games_collection))
  end

  def save_author_data
    @authors_collection = []
    @authors.each do |author|
      @authors_collection.push('First Name' => author.first_name, 'Last Name' => author.last_name)
    end
    File.write('author.json', JSON.pretty_generate(@authors_collection))
  end

  def parse_game_data
    File.write('game.json', JSON.pretty_generate([])) unless File.exist?('game.json')
    JSON.parse(File.read('game.json')).map do |game|
      @games << Game.new(game['last_played_at'], game['multiplayer'], game['publish_date'])
    end
  end

  def parse_author_data
    File.write('author.json', JSON.pretty_generate([])) unless File.exist?('author.json')
    JSON.parse(File.read('author.json')).map do |author|
      @authors << Author.new(author['first_name'], author['last_name'])
    end
  end
end
