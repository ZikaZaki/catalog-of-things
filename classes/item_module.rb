require_relative './game'
require_relative './book'
require_relative './label'

require 'date'

module ItemModule
  attr_accessor :books, :labels

  def initialize
    @item_option = '0'
  end

  def add_book
    puts 'Publisher:'
    publisher = gets.chomp
    puts 'Please enter cover state of the book:'
    cover_state = gets.chomp
    puts 'Please enter the publish date (yyyy-mm-dd) of the book:'
    publish_date = gets.chomp
    book = Book.new(publisher, cover_state, publish_date)
    @books << book
    add_label
    puts 'Book added successfully!'
  end

  def list_books
    puts 'Books:'
    @books.each do |book|
      puts "Publisher: #{book.publisher}"
      puts "Cover state: #{book.cover_state}"
      puts "Publish date: #{book.publish_date}"
      puts '----------------'
    end
  end

  def add_label
    puts 'Please enter the label Title of the book:'
    title = gets.chomp
    puts 'Please enter the color of the label:'
    color = gets.chomp
    @labels << Label.new(title, color)
    # puts 'Label added successfully!'
  end

  def list_label
    @labels.each do |label|
      puts "Title: #{label.title} - Color: #{label.color}"
      puts '-----------------'
    end
  end

  def validate_date(date)
    if validate?(date)
      date
    else
      print 'Add a valid date format [yyyy-mm-dd] : '
      valid_format = gets.chomp
      validate_date(valid_format)
    end
  end

  def add_game
    print 'Enter last played date (yyyy-mm-dd): '
    user_input = gets.chomp
    last_played_at = validate_date(user_input)

    print 'Enter publish date (yyyy-mm-dd): '
    user_input3 = gets.chomp
    publish_date = validate_date(user_input3)

    print 'Is this game a multiplayer? [Y/N] ::'
    user_input_second = gets.chomp.downcase
    multiplayer = multiplayer?(user_input_second)

    game = Game.new(last_played_at, publish_date, multiplayer)
    puts ' Author details \n'
    print ' Enter first_name ::'
    first_name = gets.chomp.to_s

    print ' Enter second_name  ::'
    second_name = gets.chomp.to_s
    author = Author.new(first_name, second_name)
    author.add_item(game)
    @authors.push(author)
    @games.push(game)
    puts 'Game added Successfully'
  end

  def validate?(date)
    Date.iso8601(date.to_s)
    true
  rescue ArgumentError
    false
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
    puts '\n List of Games : '
    puts '\n There are no games now.' if @games.empty?
    @games.each do |game|
      puts "Date Last Played: #{game.last_played_at}\
      Date Published:#{game.publish_date}\
      Is it a multiplayer: #{game.multiplayer}"
    end
  end

  def list_author
    puts "\n List of authors : "
    @authors.each_with_index { |author, index| puts "#{index}) Author ~ #{author.first_name} #{author.last_name}" }
  end
end
