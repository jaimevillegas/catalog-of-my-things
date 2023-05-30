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
  def add_music_album(id, publish_date, on_spotify)
    music_album = MusicAlbum.new(id, publish_date, on_spotify)
    @music_albums << music_album
  end
end
