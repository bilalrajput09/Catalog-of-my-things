require_relative 'store_helper'
require_relative 'book'
require_relative 'label'

class DataLoaderHelper
  def initialize
    @store = StoreHelper.new
  end

  def load_books(app)
    book_list = @store.read_files('book.json')
    book_list.each do |book|
      book_obj = Book.new(publisher: book['publisher'], cover_state: book['cover_state'],
                          publish_date: book['publish_date'])

      label_obj = Label.new(title: book['label'][0]['title'], color: book['label'][0]['color'])

      book_obj.assign_label(label_obj)
      app.list_of_books << book_obj
    end
  end
end
