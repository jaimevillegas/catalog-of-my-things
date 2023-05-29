require_relative 'item'

class MusicAlbum < Item
  attr_accessor :genre, :author, :source, :label

  def initialize(id, publish_date, archived, on_spotify)
    super(id, publish_date, archived)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    super.can_be_archived? == true && @on_spotify == true
  end
  private :can_be_archived?
end
