class Genre
  attr_accessor :name, :items, :id

  def initialize(name, id = nil)
    @id = id || rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    return unless item.instance_of?(Item) && !@items.include?(item)

    @items << item
    item.add_genre = self
  end
end
