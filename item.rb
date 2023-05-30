require 'date'

class Item
  attr_accessor :publish_date, :genre, :label
  attr_reader :id, :author, :archived

  def initialize(publish_date, id = nil)
    @id = id || rand(1..1000)
    @publish_date = publish_date
    @archived = false
  end

  def can_be_archived?
    Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_label=(label)
    @label = label
    label.add_item(self)
  end

  def add_genre=(genre)
    @genre = genre
    genre.add_item(self)
  end

 private :can_be_archived?
end
