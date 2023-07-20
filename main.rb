require_relative 'select_option'
require_relative 'app'
require_relative 'data_loader_helper'

def main
  select_option = SelectOption.new
  app = App.new
  data_loader = DataLoaderHelper.new
  data_loader.load_books(app)
  data_loader.load_games(app)
  data_loader.load_music_albums(app)
  loop do
    show_menu
    select_option.options(app)
  end
end

def show_menu
  puts '1- List all books.'
  puts '2- List all music albums.'
  puts '3- List all games.'
  puts '4- List all genres.'
  puts '5- List all labels.'
  puts '6- List all authors.'
  puts '7- Add a book.'
  puts '8- Add a music album.'
  puts '9- Add a game.'
  puts '10- Exit.'
end

main
