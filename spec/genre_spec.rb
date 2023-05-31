require_relative '../genre'
require_relative '../item'

describe Genre do
  let(:genre) { Genre.new('Pop') }

  describe 'when initialize' do
    it 'should be a Genre class' do
      expect(genre).to be_a(Genre)
    end

    it 'should have a id' do
      expect(genre.id).to be_a(Integer)
    end

    it 'should have a name' do
      expect(genre.name).to be_a(String)
    end

    it 'should have a items' do
      expect(genre.items).to be_a(Array)
    end
  end

  describe 'when call add_item' do
    let(:item) { Item.new('2020-01-01', false) }

    it 'should return the item' do
      genre.add_item(item)
      expect(genre.items[0]).to be(item)
    end

    it 'should return nil' do
      expect(genre.add_item('item')).to be(nil)
    end

    it 'should return the genre name' do
      genre.add_item(item)
      expect(item.genre.name).to eq('Pop')
    end
  end
end
