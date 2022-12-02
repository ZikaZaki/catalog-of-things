require './classes/author'
require './classes/item_module'
require './classes/store'
require 'json'

class App
  include ItemModule
  include Store

  def initialize
    @games = []
    @authors = []
    @books = []
    @labels = []

    @choice_list = {
      '1' => 'List all books.',
      '2' => 'List all labels (e.g. Gift, New)',
      '3' => 'Add a book',
      '4' => 'Add Music Album',
      '5' => 'List all genres (e.g Comedy, Thriller)',
      '6' => 'List all music albums',
      '7' => 'Add a game.',
      '8' => 'List of games.',
      '9' => 'List all authors (e.g. Stephen King).',
      '10' => 'Exit'

    }
  end

  def run
    parse_game_data
    parse_author_data
    parse_book_data
    parse_label_data
    loop do
      puts '\nPlease choose your option by entering a number 😊 :'
      puts '\n'
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print '\nYour option ==> '
      option = gets.chomp
      break if option == '10'

      handle_option(option)
    end
    exit
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def handle_option(option)
    case option
    when '1'
      list_books
    when '2'
      list_label
    when '3'
      add_book
    when '4'
      puts 'Loading1 ...'
    when '5'
      puts 'Loading2 ...'
    when '6'
      puts 'Loading3 ...'
    when '7'
      add_game
    when '8'
      list_games
    when '9'
      list_author
    else
      puts 'Invalid option ❌ please choose again'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity

  def exit
    save_game_data
    save_author_data
    save_book_data
    save_label_data

    puts '\n Your data is saved'
  end
end
