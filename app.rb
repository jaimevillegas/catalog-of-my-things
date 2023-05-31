require 'json'
require_relative 'author'
require_relative './book'
require_relative 'game'
require_relative 'genre'
require_relative 'label'
require_relative 'Modules/data_module'
require_relative 'Modules/main_methods'

class App
  include DataModule
  include MainMethods

  def initialize
    @options = [
      'List all books', 'List all Music Albums', 'List all Games', 'List all Genres',
      'List all Labels', 'List all Authors', 'Add a Book',
      'Add a Music Album', 'Add a Game', 'Exit'
    ]

    @authors = read_authors
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
      choice = gets.chomp.to_i
      case choice
      when 1
        list_all_books(@books)
      when 2
        list_music_albums(@music_albums)
      when 3
        list_all_games(@games)
      when 4
        list_all_genres(@genres)
      when 5
        list_all_labels(@labels)
      when 6
        list_all_authors(@authors)
      when 7
        @books.push(add_book)
      when 8
        @music_albums.push(add_music_album)
      when 9
        @games.push(add_game)
      when 10
        exit_program
      end
    end
  end

  def exit_program
    puts 'Goodbye!'
    write_books(@books)
    store_music_albums
    exit
  end
end

app = App.new
app.welcome
