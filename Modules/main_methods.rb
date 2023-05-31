require_relative '../book'
require_relative '../label'
require_relative '../music_album'
require_relative '../genre'

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

  # create a method for list all the music albums
  def list_music_albums(music_albums)
    puts 'No music albums found' if music_albums.empty?

    puts 'LIST OF MUSIC ALBUMS:'
    @music_albums.each_with_index do |music_album, index|
      puts "#{index + 1} -Publish date: #{music_album.publish_date}, On spotify: #{music_album.on_spotify}"
    end
    puts '------------------'
  end

  # create a method for list all the genres
  def list_genres(genres)
    return 'No genres found' if genres.empty?

    genres.each_with_index do |genre, index|
      puts "#{index + 1} ID: #{genre.id}, Name: #{genre.name}"
    end
    puts '------------------'
  end

  # create a method for add a music album
  def add_music_album
    puts 'Please enter the pushlish date[YYYY-MM-DD]'
    publish_date = gets.chomp
    puts 'Please enter if the album is on spotify [y/n]'
    on_spotify1 = gets.chomp
    case on_spotify1
    when 'y'
      on_spotify = true
    when 'n'
      on_spotify = false
    else
      puts 'Please enter a valid option'
    end
    MusicAlbum.new(0, publish_date, on_spotify)
  end

  def add_genre
    puts 'Please enter the name of the genre'
    name = gets.chomp
    Genre.new(name)
  end
end
