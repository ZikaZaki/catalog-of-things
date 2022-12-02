require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label
  attr_accessor :publish_date, :archived

  def initialize(publish_date:, id: Random.rand(1...1000), archived: false)
    @id = id
    @publish_date = Date.strptime(publish_date, '%Y-%m-%d')
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def source=(source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  def can_be_archived?
    archived_date = Date.iso8601(@publish_date).next_year(10)
    Date.today > archived_date
  end

  def to_json(*args)
    {
      'id' => @id,
      'publish_date' => @publish_date,
      'archived' => @archived,
      'genre' => @genre,
      'author' => @author,
      'source' => @source,
      'label' => @label
    }.to_json(*args) # this method will auto_convert to json
  end
end
