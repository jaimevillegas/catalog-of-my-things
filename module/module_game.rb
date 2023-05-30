module GamesAuthorModule
  # method to list games
  def list_games
    @games = load_data('./data/games.json')
    return puts 'There are no games available' if @games.empty?

    @games.each { |game| puts "Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}" }
  end

  # method to list authors
  def list_authors
    @authors = load_data('./data/author.json')
    return puts 'There are no authors available' if @author.empty?

    @author.each { |author| puts "First name: #{author['first_name']}, Last name: #{author['last_name']}" }
  end

  # create a new game
  def add_game
    print 'Multiplayer: '
    multiplayer = gets.chomp

    print 'Last played at (format: YYYY-MM-DD): '
    last_played_at = gets.chomp

    game = Game.new(multiplayer, last_played_at)
    @games << game
    save_data(@games, './data/games.json')

    puts 'Game added successfully'
  end
end
