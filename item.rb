require 'date'

class Item
  attr_accessor :publish_date, :label, :author, :genre

  def initialize(publish_date:, id: rand(0...100_000).to_s)
    @id = id,
          @publish_date = publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def assign_label(label_object)
    @label = label_object
    label_object.add_item(self) unless label_object.items.include?(self)
  end

  def assign_author(author_obj)
    @author = author_obj
    author_obj.add_item(self) unless author_obj.items.include?(self)
  end

  def assign_genre(genre_obj)
    @genre = genre_obj
    genre_obj.add_item(self) unless genre_obj.items.include?(self)
  end

  private

  def can_be_archived?
    date = Date.today
    publish_date_obj = Date.parse(publish_date)
    difference = (date - publish_date_obj) / 365
    return true if difference > 10

    false
  end
end
