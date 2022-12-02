require './app/helpers/app_menu'

module DataOperations
  def self.list_all_books(books)
    if books.any?
      books.each do |book|
        puts "id: #{book.id}, publisher: #{book.publisher}, publish_date: #{book.publish_date}"
      end
    else
      AppMenu.error_msg('There are no books in the library!')
    end
  end

  def self.list_all_music_albums(albums)
    if albums.any?
      albums.each do |album|
        puts "id: #{album.id}, publish_date: #{album.publish_date}, on_spotify: #{album.on_spotify}"
      end
    else
      AppMenu.error_msg('There are no music-albums!')
    end
  end

  def self.list_all_games(games)
    if games.any?
      games.each do |game|
        puts "id: #{game.id}, publish_date: #{game.publish_date},\n
        last_played_at: #{game.last_played_at}, multiplayer: #{game.multiplayer}"
      end
    else
      AppMenu.error_msg('There are no games!')
    end
  end

  def self.list_all_genres(genres)
    if genres.any?
      genres.each do |genre|
        puts "id: #{genre.id}, name: #{genre.name}"
      end
    else
      AppMenu.error_msg('There are no genres!')
    end
  end

  def self.list_all_labels(labels)
    if labels.any?
      labels.each do |label|
        puts "id: #{label.id}, title: #{label.title}, color: #{label.color}"
      end
    else
      AppMenu.error_msg('There are no labels!')
    end
  end

  def self.list_all_authors(authors)
    if authors.any?
      authors.each do |author|
        puts "id: #{author.id}, first_name: #{author.first_name}, last_name: #{author.last_name}"
      end
    else
      AppMenu.error_msg('There are no authors!')
    end
  end

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
    on_spotify = gets.chomp.to_s.downcase == 'y' ? true : false
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
    multiplayer = gets.chomp.to_s.downcase == 'y' ? true : false
    game = Game.new(publish_date: publish_date, last_played_at: last_played_at, multiplayer: multiplayer)
    add_author.add_item(game)
    AppMenu.success_msg('Game was added successfully!')
    game
  end
end
