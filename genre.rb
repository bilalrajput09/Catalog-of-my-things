class Gener
  attr_accessor :name
  attr_reader :items

  def initialize(name:, id: rand(0..10_000).to_s)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item_obj)
    @items << item_obj
  end
end
