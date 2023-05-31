require './game'
require './author'
require_relative 'game_author_preserve'

class GameAuthor
  def initialize
    @games = load_data('./Data/games.json') || []
    @author = load_data('./Data/author.json') || []
  end

  # method to list games
  def list_games
    @games = load_data('./Data/games.json')
    return puts 'There are no games available' if @games.empty?

    puts
    puts 'LIST OF GAMES:'
    @games.each_with_index { |game, index| puts "#{index + 1} -Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}" }
  
    puts '------------------'
    puts
    end

  # method to list authors
  def list_authors
    @author = load_data('./Data/author.json')
    return puts 'There are no authors available' if @author.empty?

    puts
    puts 'LIST OF AUTHORS:'
    @author.each_with_index { |author, index| puts "#{index + 1} -First name: #{author['first_name']}, Last name: #{author['last_name']}" }
  
    puts '------------------'
    puts
  end

  # Add a new author
  def add_author
    print 'First name: '
    first_name = gets.chomp

    print 'Last name: '
    last_name = gets.chomp

    author = Author.new(first_name, last_name)
    @author << author
    save_data(@author, './Data/author.json')

    puts 'author added successfully'
  end

  # create a new game
  def add_game
    print 'Multiplayer: '
    multiplayer = gets.chomp

    print 'Last played at (format: YYYY-MM-DD): '
    last_played_at = gets.chomp

    game = Game.new(multiplayer, last_played_at)
    @games << game
    save_data(@games, './Data/games.json')

    puts 'Game added successfully'
  end
end
