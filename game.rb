require './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  def initialize(multiplayer, last_played_at, id = nil)
    # Pass last_played_at as publish_date parameter
    super(last_played_at, id)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    return false if @last_played_at.nil?

    super && (Date.today.year - Date.parse(@last_played_at.to_s).year > 2)
  end

  def to_h
    { multiplayer: @multiplayer,
      last_played_at: @last_played_at }
  end
end
