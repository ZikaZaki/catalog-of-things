require './lib/classes/item'
require './lib/classes/game'

RSpec.describe Game do
  before :each do
    @game = [
      Game.new( publish_date:'2020-10-21', multiplayer: true, last_played_at: '2009-10-02'),
      Game.new( publish_date:'2021-10-21', multiplayer: false, last_played_at: '2010-10-02'),
      Game.new( publish_date:'2022-10-21', multiplayer: true, last_played_at: '2011-10-02'),
    ]
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

  it 'check if the game can be archieved' do
    can_be_archived = @game[0].send(:can_be_archived?)
    expect(can_be_archived).to be true
  end
end
