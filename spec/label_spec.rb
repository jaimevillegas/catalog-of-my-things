require 'rspec'
require_relative '../label'

describe Label do
  before :each do
    @label = Label.new('Label', 'Red')
    @item = Item.new('2010-01-01')
  end

  describe '#new' do
    it 'should create a new label' do
      expect(@label).to be_an_instance_of(Label)
    end

    it 'should throw an ArgumentError if given fewer than 2 parameters' do
      expect { Label.new('Label') }.to raise_error(ArgumentError)
    end

    it 'should set title to Label' do
      expect(@label.title).to eq('Label')
    end

    it 'should set color to Red' do
      expect(@label.color).to eq('Red')
    end
  end

  describe '#add_item' do
    it 'should add an item to the label' do
      @label.add_item(@item)
      expect(@label.items[0]).to be(@item)
    end

    it 'should add the item only once' do
      @label.add_item(@item)
      @label.add_item(@item)
      expect(@label.items.length).to eq(1)
    end

    it 'should add the label to the item' do
      @label.add_item(@item)
      expect(@item.label).to be(@label)
    end

  end
end