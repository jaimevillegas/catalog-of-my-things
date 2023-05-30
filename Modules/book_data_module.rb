require_relative '../book'
require 'json'

module BookData
  def read_books
    file = './Data/books.json'
    data = []

    if File.exist?(file) && File.read(file) != ''
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
      File.write('./Data/books.json', JSON.pretty_generate(data))
    end
  end
                            
