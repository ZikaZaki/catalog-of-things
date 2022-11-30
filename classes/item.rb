class Item
    attr_reader :id;
    attr_accessor :genre, :publish_date, :source, :author
    def initialize(publish_date)
        @id=Random.rand(1...1000)
        @genre=nil
        @author=nil
        @source=nil
        @archieved=false
        @publish_date=publish_date
    end
    def can_be_achieved?
        archived_date = Date.iso8601(@publish_date).next_year(10)
        Date.today > archived_date
    end

    def move_to_archive()
        @archieved=can_be_achieved
    end
end