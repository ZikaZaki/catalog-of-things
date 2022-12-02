require 'colorize'

module AppMenu
  def self.welcome_msg
    msg = 'Welcome To Your Catalog of Things App!'.colorize(:blue)
    puts "\n#{'*' * msg.length}\n****** #{msg} ******\n#{'*' * msg.length}\n"
  end

  def self.exit_msg
    msg = "Thanks for using the app! \u{270B}".colorize(:blue)
    puts "\n#{'*' * msg.length}\n***** #{msg}  *****\n#{'*' * msg.length}\n"
  end

  def self.display_options
    print <<~DOC
      ----------------------------------------------------
      Please choose your option by entering a number 😊 :
      ----------------------------------------------------
      1- List All Books
      2- List All Music-Albums
      3- List All Games
      4- List All Genres
      5- List All Labels
      6- List All Authors
      7- Add A Book
      8- Add A Music-Album
      9- Add A Game
      0- Exit
      ----------------------------------------------------
    DOC
    print 'Enter you choice : '
  end

  def self.success_msg(msg)
    puts "\n\n#{msg} 😊\n".colorize(:green)
    puts 'Your data is saved'.colorize(:green)
  end

  def self.error_msg(msg)
    puts "\n#{msg} ❌\n".colorize(:red)
  end
end
