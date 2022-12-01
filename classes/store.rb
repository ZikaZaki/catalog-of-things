require 'json'
require_relative 'game'

module Store
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
