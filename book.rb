require_relative './item'

class Book < Item
  attr_accessor :title, :publisher, :cover_state

  def initialize(publisher, cover_state)
    super()
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state.downcase == 'bad'
  end
end
