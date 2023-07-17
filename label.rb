class Label
  attr_reader :items
  attr_accessor :title, :color

  def initialize(title:, color:, id: rand(0..100_000).to_s)
    @id = id
    @title = title
    @color = color
    @items = []
  end

  def add_item(item_object)
    @items << item_object
    item_object.label = self
  end
end
