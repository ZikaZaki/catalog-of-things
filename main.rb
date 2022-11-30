#  rubocop:disable all
require './author'
require './item_module'
require './store'
require 'json'

class App
  include ItemModule
  include Store

  def initialize
    @games = []
    @authors = [Author.new('Kang', 'Adventure'), Author.new('Luis', 'Action'), Author.new('Melissa', 'Horror'), Author.new('Mo', 'Sport')]
    @choice_list = {
      '1' => 'List of games.',
      '2' => 'List all authors (e.g. Stephen King).',
      '3' => 'Add a game.',
      '4' => 'Exit',
      
    }  
  end

  def run
    parse_data
    puts "Welcome to the Catalog of your Things 🗂️ \n"

    loop do
      puts "\nPlease choose your option by entering a number 😊 :"
      puts "\n"
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print "\nYour option ==> "
      option = gets.chomp
      if option == '4'
        exit
        break
      end

      handle_option(option)
    end
  end

  def handle_option(option)
    case option
    when '1'
      list_games
    when '2'
      list_author
    when '3'
      add_game
    else
      puts 'Invalid option ❌ please choose again'
    end
  end

  def exit
    save_data
    puts "\n Your data is saved"
  end
end


app = App.new
app.run