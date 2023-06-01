require 'rspec'
require_relative '../book'

describe Book do
  before :each do
    @book = Book.new('Awesome book', 'Publisher', 'Good', '2010-01-01', true)
  end

  describe '#new' do
    it 'should create a new book' do
      expect(@book).to be_an_instance_of(Book)
    end

    it 'should be a kind of Item' do
      expect(@book).to be_a_kind_of(Item)
    end

    it 'should throw an ArgumentError if given fewer than 3 parameters' do
      expect { Book.new('Publisher', 'Good') }.to raise_error(ArgumentError)
    end

    it 'should set cover_state to Good' do
      expect(@book.cover_state).to eq('Good')
    end

    it 'should not have publisher settable' do
      expect { @book.publisher = 'New Publisher' }.to raise_error(NameError)
    end
  end

  describe '#can_be_archived?' do
    it 'should return true if date is earlier than 10 years' do
      book = Book.new('Awesome book', 'Publisher', 'Good', '2010-01-01', true)
      expect(book.can_be_archived?).to eq(true)
    end

    it 'should return true if cover_state is bad' do
      book = Book.new('Awesome book', 'Publisher', 'bad', '2010-01-01', true)
      expect(book.can_be_archived?).to eq(true)
    end

    it 'should return false if cover_state != bad && date < 10 years' do
      book = Book.new('Awesome book', 'Publisher', 'good', '2020-01-01', true)
      expect(book.can_be_archived?).to eq(false)
    end
  end
end
