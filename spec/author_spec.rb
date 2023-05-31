require 'rspec'
require_relative '../author'
require_relative '../item'

describe Author do
  context 'Create instance of Author class' do
    author = Author.new('Johnie', 'Njoroge')
    item = Item.new('2017-05-09', false)

    it 'should return instance of Book class' do
      expect(author).to be_instance_of(Author)
    end
    it 'should throw an ArgumentError if given fewer than 2 parameters' do
      expect { Author.new('Johnny') }.to raise_error(ArgumentError)
    end
    it 'returns the correct first name' do
      author.first_name.should eql 'Johnie'
    end
    it 'returns the correct last name' do
      author.last_name.should eql 'Njoroge'
    end
    it 'Adding items' do
      author.add_item(item)
      expect(author.items.size).to eql 1
    end
    it 'returns the added item' do
      author.add_item(item)
      expect(author.items[0]).to be(item)
    end
  end
end
