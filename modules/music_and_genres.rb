module MusicAndGenres
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
    puts 'Please enter the genre id'
    genre_id = gets.chomp.to_i
    puts 'Please enter the pushlish date'
    publish_date = gets.chomp
    puts 'Please enter if the album is on spotify'
    on_spotify = gets.chomp
    music_album = MusicAlbum.new(id, publish_date, on_spotify)
    @music_albums << music_album
  end
end
