require './item'
require 'date'

class Game < Item
    def initialize(multiplayer, last_played_at)
        super()
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        super && (Date.today.year - Date.parse(@last_played_at).year > 2)
    end
      
en