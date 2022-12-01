require './classes/author'
require './classes/item_module'
require './classes/store'
require 'json'

class App
  include ItemModule
  include Store

  def initialize
    @games = []
    @authors = [Author.new('Loltolo', 'Lesapiti'), Author.new('Lerisen', 'Taasio'), Author.new('Joseph', 'Ouko'),
                Author.new('Stephen', 'King')]
    @choice_list = {
      '1' => 'List of games.',
      '2' => 'List all authors (e.g. Stephen King).',
      '3' => 'Add a game.',
      '4' => 'Exit'

    }
  end

  def run
    parse_data
    loop do
      puts "\nPlease choose your option by entering a number 😊 :"
      puts "\n"
      @choice_list.each do |key, value|
        puts "#{key} - #{value}"
      end
      print "\nYour option ==> "
      option = gets.chomp
      break if option == '4'

      handle_option(option)
    end
    exit
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
