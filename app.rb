require 'json'
require_relative 'author'
require_relative './book'
require_relative 'game'
require_relative 'genre'
require_relative 'label'
require_relative 'Modules/data_module'
require_relative 'Modules/main_methods'
require_relative 'Modules/game_author'

class App
  include DataModule
  include MainMethods

  def initialize
    @options = [
      'List all books', 'List all Music Albums', 'List all Games', 'List all Genres',
      'List all Labels', 'List all Authors', 'Add a genre', 'Add a Book',
      'Add a Music Album', 'Add a Game', 'Add an author', 'Exit'
    ]

    @game_author = GameAuthor.new
    @books = read_books
    @labels = read_labels
    @genres = load_genres
    @music_albums = load_music_albums
  end

  def welcome
    loop do
      puts 'What would you like to do?'
      @options.each_with_index { |option, index| puts "#{index + 1}. #{option}" }
      print 'Enter your choice: '
      @choice = gets.chomp.to_i
      options(@choice)
    end
  end

  def choice1(choice)
    case choice
    when 1
      list_all_books(@books)
    when 2
      list_music_albums(@music_albums)
    when 3
      @game_author.list_games
    when 4
      list_genres(@genres)
    when 5
      list_all_labels(@labels)
    when 6
      @game_author.list_authors
    end
  end

  def choice2(choice)
    case choice
    when 7
      @genres.push(add_genre)
    when 8
      @books.push(add_book)
    when 9
      @music_albums.push(add_music_album)
    when 10
      @game_author.add_game
    when 11
      @game_author.add_author
    when 12
      exit_program
    end
  end

  def options(choice)
    case choice
    when 1..6
      choice1(choice)
    when 7..12
      choice2(choice)
    else
      puts 'Invalid choice'
    end
  end

  def exit_program
    puts 'Goodbye!'
    write_books(@books)
    store_music_albums
    store_genres
    exit
  end
end

app = App.new
app.welcome
