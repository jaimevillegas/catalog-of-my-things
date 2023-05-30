require_relative '../book'

module BookModule
  def list_all_books(books)
    if books.empty?
      puts 'No books found.'
    else
      books.each do |book|
        puts "#{book.id} - Title: #{book.title}, Publisher: #{book.author}, Cover: #{book.cover_state}"
      end
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
end
