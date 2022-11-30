require_relative './game'
require 'date'
module ItemModule
  def initialize
    @item_option = '0'
  end

  def validate_date(date)
    if is_Validate?(date)
      date
    else
      print 'Add a valid date format [yyyy-mm-dd] : '
      valid_format = gets.chomp
      validate_date(valid_format)
    end
  end

 def add_game
  print 'Enter last played date (yyyy-mm-dd): '
  userInput1 = gets.chomp
  last_played_at = validate_date(userInput1)

  print 'Is this game a multiplayer? [Y/N]: '
  userInput2 = gets.chomp.downcase
  multiplayer = multiplayer?(userInput2)

  print 'Enter publish date (yyyy-mm-dd): '
  userInput3 = gets.chomp
  publish_date = validate_date(userInput3)

  game = Game.new( publish_date, last_played_at, multiplayer)
  author = game_author
  author.add_item(game)
  @games.push(game)
  puts 'Game added Successfully'
 end

 def is_Validate?(date)
  Date.iso8601(date.to_s)
  true
  rescue ArgumentError
  false
end
 def game_author
  list_author
  print "\n Select author using number: "
  author_index = gets.chomp.to_i
  @authors[author_index]
 end

 def multiplayer?(answer)
  case answer
  when 'n'
    false
  when 'y'
    true
  else
    print 'Please specify [Y/N]: '
    new_answer = gets.chomp
    multiplayer?(new_answer)
  end
 end

 def list_games
  puts "\n List of Games : "
  puts "\n There are no games now." if @games.empty?
  @games.each { |game| puts "Date Last Played: #{game.last_played_at} Date Published: #{game.publish_date} Is it a multiplayer: #{game.multiplayer}"}
 end

 def list_author
  puts "\n List of authors : "
  @authors.each_with_index { |author, index| puts "#{index}) Author ~ #{author.first_name} #{author.last_name}" }
 end

end
