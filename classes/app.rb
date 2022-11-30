require './game'
require 'date'
require './author'
class App
    def initialize
        @item_option = '0'
        @games=[]
        @authors=[]
      end
    def options
        puts '******Welcome to the game *******'
        puts 'Select the options below to continue'
        puts '1 : List of games '
        puts '2 : List all authors (e.g. Stephen King)'
        puts '3 : Add a game'
    end

    def add_selected_item
        case @item_option
        when '1'
          puts 'create_book'
        when '2'
          puts 'create_music_album'
        when '3'
         add_game
        else
          puts "\n please choose a valid option\n"
        end
      end

      def validate_choices
        until %w[1 2 3].include?(@item_option)
            options
          @item_option = gets.chomp
          add_selected_item
        end
        @item_option = '0'
      end

      def game_info
        print 'Last played at (yyyy-mm-dd): '
        date_answer = gets.chomp
        last_played_at = date_answer
      
        print 'Is it Multiplayer? [Y/N]: '
        answer = gets.chomp.downcase
        multiplayer = multiplayer?(answer)
      
        print 'Publish date (yyyy-mm-dd): '
        publisher_answer = gets.chomp
        publish_date = validate_date(date_answer)
      
        [last_played_at, publish_date, multiplayer]
      end

      def add_game
        publish_date, multiplayer, last_played_at = game_info
        game = Game.new( publish_date, multiplayer, last_played_at)
        author = game_author
        author.add_item(game)
        @games.push(game)
        puts 'Game created successfully ✔️'
      end

      def validate?(date)
        Date.iso8601(date.to_s)
        true
      rescue ArgumentError
        false
      end
    
      def validate_date(date)
        if validate?(date)
          date
        else
          print 'Add a valid date format [yyyy-mm-dd] : '
          answer = gets.chomp
          validate_date(answer)
        end
      end

        def game_author
            list_author
            print "\n Select your author by number: "
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
              print 'Could you please specify your answer by [Y/N]: '
              new_answer = gets.chomp
              multiplayer?(new_answer)
            end
           end
           def list_author
            puts "\n List of authors : "
            @authors.each_with_index { |author, index| puts "#{index}) Author ~ #{author.first_name} #{author.last_name}" }
          end
end

myApp=App.new()
myApp.validate_choices

 