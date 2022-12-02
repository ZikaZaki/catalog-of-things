require './lib/classes/author'
require './lib/classes/game'

describe Author do
    it "has a name" do
        author = Author.new(first_name: "Zack", last_name: "Ali")
        expect(author.first_name).to eq("Zack")
        expect(author.last_name).to eq("Ali")
    end

    it "author has a game" do
        game = Game.new(publish_date: '2020-10-21', multiplayer: true, last_played_at: '2009-10-02')
        author = Author.new(first_name: "Zack", last_name: "Ali")
        author.add_item(game)
        expect(author.items.include?(game)).to eq(true)
    end
    
    it "author is an instance of Author" do
        author = Author.new(first_name: "Zack", last_name: "Ali")
        expect(author).to be_an_instance_of(Author)
    end
end
