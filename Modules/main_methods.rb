require_relative '../book'
require_relative '../label'
require_relative '../game'
require_relative '../music_album'

module MainMethods
  def list_all_books(books)
    if books.empty?
      puts 'No books found.'
    else
      puts
      puts 'LIST OF BOOKS:'
      books.each do |item|
        puts "#{item.id} - Title: #{item.title}, Publisher: #{item.publisher}, Cover: #{item.cover_state}"
      end
      puts '------------------'
      puts
    end
  end

  def add_book
    print 'Title: '
    title = gets.chomp
    print 'Publisher: '
    publisher = gets.chomp
    print 'Cover state: '
    cover_state = gets.chomp
    print 'Publish date [YYYY-MM-DD]: '
    publish_date = gets.chomp
    print 'Archived? [y/n]: '
    archived = gets.chomp.downcase == 'y'
    Book.new(title, publisher, cover_state, publish_date, archived)
  end

  def list_all_labels(labels)
    if labels.empty?
      puts 'No labels found.'
    else
      labels.each do |label|
        puts "[#{label.id}] - Title: #{label.title}, color: #{label.color}"
      end
    end
  end

  def list_games
    @games = load_data('./data/games.json')
    return puts 'There are no games available' if @games.empty?

    @games.each { |game| puts "Multiplayer: #{game['multiplayer']}, Last played at: #{game['last_played_at']}" }
  end

  def add_author
    print 'First name: '
    first_name = gets.chomp
    print 'Last name: '
    last_name = gets.chomp
    Author.new(first_name, last_name)
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

  # create a method for list all the music albums
  def list_music_albums
    return 'No music albums found' if @music_albums.empty?

    @music_albums.each do |music_album|
      puts "ID: #{music_album.id}, Publish Date: #{music_album.publish_date}"
      puts "On Spotify: #{music_album.on_spotify}, Archived: #{music_album.archived}"
    end
  end

  # create a method for list all the genres
  def list_genres
    return 'No genres found' if @genres.empty?

    @genres.each do |genre|
      puts "ID: #{genre.id}, Name: #{genre.name}"
    end
  end

  # create a method for add a music album
  def add_music_album
    puts 'Please enter the album id'
    id = gets.chomp.to_i
    puts 'Please enter the pushlish date'
    publish_date = gets.chomp
    puts 'Please enter if the album is on spotify'
    on_spotify = gets.chomp
    music_album = MusicAlbum.new(id, publish_date, on_spotify)
    @music_albums << music_album
  end
end
