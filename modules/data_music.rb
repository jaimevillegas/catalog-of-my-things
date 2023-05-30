module DataMusic
  def album_to_hash(album)
    {
      id: album.id,
      publish_date: album.publish_date,
      on_spotify: album.on_spotify
    }
  end

  def genre_to_hash(genre)
    {
      id: genre.id,
      name: genre.name
    }
  end

  def store_music_albums
    File.write('albums.json', @music_albums.map { |album| album_to_hash(album) }.to_json)
  end

  def store_genres
    File.write('genres.json', @genres.map { |genre| genre_to_hash(genre) }.to_json)
  end

  def load_music_albums
    return unless File.exist?('albums.json') && File.size?('albums.json')

    JSON.parse(File.read('albums.json')).each do |album|
      @music_albums << MusicAlbum.new(album['id'], album['publish_date'], album['on_spotify'])
    end
  end

  def load_genres
    return unless File.exist?('genres.json') && File.size?('genres.json')

    JSON.parse(File.read('genres.json')).each do |genre|
      @genres << Genre.new(genre['id'], genre['name'])
    end
  end
end
