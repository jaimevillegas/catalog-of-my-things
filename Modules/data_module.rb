require 'json'
require_relative '../book'

module DataModule
  def read_books
    file = './Data/books-data.json'
    data = []

    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |book|
        data.push(Book.new(book['title'], book['publisher'], book['cover_state'],
                           book['publish_date'], book['archived'], book['id']))
      end
    end
    data
  end

  def write_books(books)
    data = []
    books.each do |book|
      data.push({ id: book.id, title: book.title, publisher: book.publisher,
                  cover_state: book.cover_state, publish_date: book.publish_date, archived: book.archived })
    end
    File.write('./Data/books-data.json', JSON.pretty_generate(data))
  end

  def read_labels
    file = './Data/labels.json'
    data = []

    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |label|
        data.push(Label.new(label['title'], label['color'], label['id']))
      end
    end
    data
  end

  def write_labels(labels)
    data = []
    labels.each do |label|
      data.push({ id: label.id, title: label.title, color: label.color })
    end
    File.write('./Data/labels.json', JSON.pretty_generate(data))
  end

  def read_authors
    file = './Data/authors.json'
    data = []

    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |author|
        data.push(Author.new(author['first_name'], author['last_name'], author['id']))
      end
    end
    data
  end

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
    File.write('data/albums.json', @music_albums.map { |album| album_to_hash(album) }.to_json)
  end

  def store_genres
    File.write('data/genres.json', @genres.map { |genre| genre_to_hash(genre) }.to_json)
  end

  def load_music_albums
    return unless File.exist?('data/albums.json') && File.size?('albums.json')

    JSON.parse(File.read('data/albums.json')).each do |album|
      @music_albums << MusicAlbum.new(album['id'], album['publish_date'], album['on_spotify'])
    end
  end

  def load_genres
    return unless File.exist?('data/genres.json') && File.size?('genres.json')

    JSON.parse(File.read('data/genres.json')).each do |genre|
      @genres << Genre.new(genre['id'], genre['name'])
    end
  end

  def save_data(data, filename)
    data_array = data.map(&:to_h) # Convert each object to a hash
    File.write(filename, JSON.generate(data_array))
  end

  def load_data(filename)
    if File.exist?(filename)
      data = File.read(filename)
      JSON.parse(data)
    else
      []
    end
  end
end
