class Item
  attr_accessor :genre, :author, :source, :label

  def initialize(id, publish_date, archived)
    @id = id
    @publish_date = publish_date
    @archived = archived
  end

  def can_be_archived?(boolean)
    if boolean == true
      return true
    else
      return false
    end
  end
  end

  def move_to_archive
    if can_be_archived? == true
      @archived = true
    else
      return false
    end
    
  end
  private: can_be_archived?
end