class Author
  attr_accessor :first_name, :last_name
  attr_reader :items

  def initialize(first_name:, last_name:, id: rand(0..1000).to_s)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item_object)
    @items << item_object
    item_object.author = self
  end
end
