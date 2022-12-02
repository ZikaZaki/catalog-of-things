require './lib/classes/label'
require './lib/classes/book'
require './lib/classes/genre'
require './lib/classes/music_album'
require './lib/classes/author'
require './lib/classes/game'
require './app/modules/load_data'
require './app/modules/store_data'
require './app/modules/data_operations'
require './app/modules/data_queries'
require './app/helpers/app_menu'

class App
  def initialize
    @labels = LoadData.load_labels
    @books = LoadData.load_books
    @genres = LoadData.load_genres
    @albums = LoadData.load_music_albums
    @authors = LoadData.load_authors
    @games = LoadData.load_games
  end

  def save_data
    StoreData.store(file_name: 'labels.json', data: @labels)
    StoreData.store(file_name: 'books.json', data: @books)
    StoreData.store(file_name: 'genres.json', data: @genres)
    StoreData.store(file_name: 'music_albums.json', data: @albums)
    StoreData.store(file_name: 'authors.json', data: @authors)
    StoreData.store(file_name: 'games.json', data: @games)
  end

  def query_data(input)
    case input
    when '1' then DataQueries.list_all_books(@books)
    when '2' then DataQueries.list_all_music_albums(@albums)
    when '3' then DataQueries.list_all_games(@games)
    when '4' then DataQueries.list_all_genres(@genres)
    when '5' then DataQueries.list_all_labels(@labels)
    when '6' then DataQueries.list_all_authors(@authors)
    end
  end

  def add_book
    book = DataOperations.add_book
    @books << book
    @labels << book.label unless @labels.include?(book.label)
  end

  def add_music_album
    album = DataOperations.add_music_album
    @albums << album
    @genres << album.genre unless @genres.include?(album.genre)
  end

  def add_game
    game = DataOperations.add_game
    @games << game
    @authors << game.author unless @authors.include?(game.author)
  end

  def process_input(input)
    case input
    when '1'..'6' then query_data(input)
    when '7' then add_book
    when '8' then add_music_album
    when '9' then add_game
    else
      AppMenu.error_msg('You have entered an invalid input!')
    end
  end

  def run
    AppMenu.welcome_msg # Welcome message called only once
    loop do
      AppMenu.display_options
      input = gets.chomp
      input == '0' ? break : process_input(input)
    end
    save_data
    AppMenu.exit_msg
  end
end
