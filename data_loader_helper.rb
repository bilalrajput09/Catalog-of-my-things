require_relative 'store_helper'
require_relative 'book'
require_relative 'label'
require_relative 'music_album'
require_relative 'genre'

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

  def load_games(app)
    games = @store.read_files('game.json')
    games.each do |game|
      game_obj = Game.new(multiplayer: game['multiplayer'], last_played_at: game['last_played_at'],
                          publish_date: game['publish_date'])
      author = Author.new(first_name: game['author'][0]['first_name'], last_name: game['author'][0]['last_name'])
      game_obj.assign_author(author)
      app.list_of_games << game_obj
    end
  end

  def load_music_albums(app)
    music_album_data = @store.read_files('music_album.json')
    music_album_data.each do |album|
      music_album = MusicAlbum.new(on_spotify: album['on_spotify'], publish_date: album['publish_date'])
      genre = Genre.new(name: album['genre'][0]['name'])
      music_album.assign_genre(genre)
      app.list_of_music_albums << music_album
    end
  end
end
