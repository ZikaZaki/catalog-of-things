require 'date'

class Item
  attr_reader :id
  attr_accessor :genre, :publish_date, :source, :author, :archived

  def initialize(publish_date, _archived)
    @id = Random.rand(1000)
    @archived = false
    @publish_date = publish_date
  end

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10) # 10 years after publish date
    Date.today > archived_date
  end

  def move_to_archive()
    @archived = can_be_archived?
  end
end
