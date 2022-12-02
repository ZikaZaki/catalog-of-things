require './app/helpers/app_menu'

module DataQueries
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
end
