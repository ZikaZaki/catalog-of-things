require './item'
class Game< Item
    def initialize(last_played_date, multiplayer, published_date)
        super(publish_date)
        @last_played_date=last_played_date
        @multiplayer=multiplayer
    end
    def can_be_archived?
        Date.today > Date.iso8601(@last_played_at).next_year(2) || super
      end
end