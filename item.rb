require 'date'

class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?
    return false unless Date.today.year - Date.parse(@publish_date).year > 10
  end

  def move_to_archive
    return unless can_be_archived? == true

    @archived = true
  end

  can_be_archived?
end
