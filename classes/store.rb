require 'json'
require_relative 'game'

module Store
  def save_data
    @games_collection = []
    @games.each do |game|
      @games_collection.push('Last_played_at' => game.last_played_at, 'Multiplayer' => game.multiplayer,
                      'Publish_date' => game.publish_date)
    end
    File.write('game.json', JSON.pretty_generate(@games_collection))
  end

  def parse_data
    unless File.exist?('game.json')
      File.open('game.json', 'w') do |f|
        f.write JSON.pretty_generate([])
      end
    end
    JSON.parse(File.read('game.json')).map do |game|
      @games << Game.new(game['last_played_at'], game['multiplayer'], game['publish_date'])
    end
  end
end