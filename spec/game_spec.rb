require_relative '../classes/game'

RSpec.describe Game do
  before :each do
    @game = [Game.new('2020-10-21', true, '2009-10-02'), Game.new('2021-10-05', true, '2020-01-19')]
  end

  it 'check if the game is a kind of Item' do
    @game.each do |game|
      expect(game).to be_kind_of Item
    end
  end

  it 'check if its an instance of a class' do
    @game.each do |game|
      expect(game).to be_instance_of Game
    end
  end

  it 'check if the game can be achieved' do
    can_be_archived = @game[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end
end