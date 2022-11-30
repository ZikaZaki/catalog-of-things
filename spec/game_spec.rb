require_relative '../classes/game'

RSpec.describe Game do
  before :each do
    @game = [Game.new('2021-11-23', true, '2010-11-22'), Game.new('2021-11-25', true, '2021-10-22')]
  end

  it 'check if game is kind of Item' do
    @game.each do |game|
      expect(game).to be_kind_of Item
    end
  end

  it 'is an instance of the class?' do
    @game.each do |game|
      expect(game).to be_instance_of Game
    end
  end
end
