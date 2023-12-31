require 'date'
require_relative 'genre'

class Item
  attr_accessor :id, :publish_date, :label, :author
  attr_reader :genre

  def initialize(date)
    @id = Random.rand(1..1000)
    @publish_date = Date.parse(date)
    @archived = false
    @genre = nil
    @author = nil
  end

  def add_genre(genre)
    if genre.instance_of?(Genre)
      @genre = genre
      genre.add_items(self) unless genre.items.include?(self)
    else
      @genre = nil
    end
  end

  def add_author(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_label(label)
    @label = label
    label.add_item(self) unless label.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    current_date = Date.today
    current_date - @publish_date >= 3652
  end
end
