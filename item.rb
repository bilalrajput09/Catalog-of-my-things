require 'date'

class Item
  attr_accessor :publish_date, :label, :gener, :author

  def initialize(publish_date:, id: rand(0...100_000).to_s)
    @id = id,
          @publish_date = publish_date
  end

  def move_to_archive
    @archived = true if can_be_archived?
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
