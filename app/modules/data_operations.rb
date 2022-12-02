require './app/helpers/app_menu'

module DataOperations
  def self.add_label
    puts 'Enter the label title of the book:'
    title = gets.chomp
    puts 'Enter the color of the label:'
    color = gets.chomp
    AppMenu.success_msg('Label was added successfully!')
    Label.new(title: title, color: color)
  end

  def self.add_book
    puts 'Enter the publisher of the book:'
    publisher = gets.chomp.to_s
    puts 'Enter the cover state of the book (new, good, bad):'
    cover_state = gets.chomp.to_s
    puts 'Enter the publish date of the book in (yyyy-mm-dd) format:'
    publish_date = gets.chomp.to_s
    book = Book.new(publish_date: publish_date, publisher: publisher, cover_state: cover_state)
    add_label.add_item(book)
    AppMenu.success_msg('Book was added successfully!')
    book
  end

  def self.add_genre
    puts 'Enter the genre\'s name:'
    name = gets.chomp.to_s
    genre = Genre.new(name: name)
    AppMenu.success_msg('Genre was added successfully!')
    genre
  end

  def self.add_music_album
    puts 'Enter the publish date of the music-album in (yyyy-mm-dd) format:'
    publish_date = gets.chomp.to_s
    puts 'Is the music-album on spotify? (y/n)'
    on_spotify = gets.chomp.to_s.downcase == 'y'
    album = MusicAlbum.new(publish_date: publish_date, on_spotify: on_spotify)
    add_genre.add_item(album)
    AppMenu.success_msg('Music-Album was added successfully!')
    album
  end

  def self.add_author
    puts 'Enter the author\'s first-name:'
    first_name = gets.chomp.to_s
    puts 'Enter the author\'s last-name:'
    last_name = gets.chomp.to_s
    author = Author.new(first_name: first_name, last_name: last_name)
    AppMenu.success_msg('Author was added successfully!')
    author
  end

  def self.add_game
    puts 'Enter the publish date of the game in (yyyy-mm-dd) format:'
    publish_date = gets.chomp.to_s
    puts 'Enter the last played date of the game in (yyyy-mm-dd) format:'
    last_played_at = gets.chomp.to_s
    puts 'Is the game multiplayer? (y/n)'
    multiplayer = gets.chomp.to_s.downcase == 'y'
    game = Game.new(publish_date: publish_date, last_played_at: last_played_at, multiplayer: multiplayer)
    add_author.add_item(game)
    AppMenu.success_msg('Game was added successfully!')
    game
  end
end
