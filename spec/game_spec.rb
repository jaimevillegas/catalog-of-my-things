require 'rspec'
require_relative '../game'

describe Game do

    context 'Create instance of Game class' do
      game = Game.new('Johnie', '2010-02-05')

      it 'should return instance of Book class' do
        expect(game).to be_instance_of(Game)
      end

      it 'sets the multiplayer attribute' do
        expect(game.multiplayer).to eq('Johnie')
      end
  
      it 'sets the last_played_at attribute' do
        expect(game.last_played_at).to eq('2010-02-05')
      end

      it 'should throw an ArgumentError if given fewer than 2 parameters' do
        expect { Game.new('Publisher') }.to raise_error(ArgumentError)
      end 

      it 'should return true if parent class can_be_archived? is true and last_played_at is older than 2 years' do
        expect(game.can_be_archived?).to eq(true)
      end

      it 'should return false if parent class can_be_archived? is false and last_played_at is older than 2 years' do
        game = Game.new('Johnie', '2015-02-05')
        expect(game.can_be_archived?).to eq(false)
      end  
      
      it 'should return false if parent class can_be_archived? is true and last_played_at is not older than 2 years' do
        game = Game.new('Johnie', '2021-02-05')
        expect(game.can_be_archived?).to eq(false)
      end
      
    end

end