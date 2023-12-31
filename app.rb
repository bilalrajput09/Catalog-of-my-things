require_relative 'book'
require_relative 'label'
require_relative 'store_helper'
require_relative 'game'
require_relative 'author'
require_relative 'genre'
require_relative 'music_album'

class App
  attr_accessor :list_of_books, :list_of_games, :list_of_music_albums

  def initialize
    @list_of_books = []
    @list_of_games = []
    @list_of_music_albums = []
    @store = StoreHelper.new
  end

  def list_all_labels
    puts
    @list_of_books.each_with_index do |book, i|
      puts "#{i}) Label title: #{book.label.title} , Label color: #{book.label.color}"
      puts
    end
  end

  def list_all_books
    puts
    @list_of_books.each_with_index do |book, i|
      puts "#{i}) This book was published on #{book.publish_date}.
      Publisher name is #{book.publisher} and book is in #{book.cover_state} state."
      puts
    end
  end

  def list_all_games
    puts
    @list_of_games.each_with_index do |game, i|
      puts "#{i}) The game is #{game.multiplayer == 'yes' ? 'a' : 'not a'} multiplayer game."
      puts "This game was published on #{game.publish_date} and last played at #{game.last_played_at}."
      puts
    end
  end

  def list_all_authors
    puts
    @list_of_games.each_with_index do |game, i|
      puts "#{i}) first name: #{game.author.first_name} last name: #{game.author.last_name}"
    end
    puts
  end

  def list_all_genres
    puts
    puts 'Genre List: '
    @list_of_music_albums.each_with_index do |album, i|
      puts "#{i}) #{album.genre.name}"
    end
    puts
  end

  def list_all_music_albums
    puts
    @list_of_music_albums.each_with_index do |album, i|
      puts "#{i}) This album was created on #{album.publish_date}."
      puts "It is #{album.on_spotify ? 'on spotify' : 'not on spotify'}"
      puts
    end
  end

  def add_a_book
    puts 'Enter title: '
    title = gets.chomp
    puts 'Enter name of publisher: '
    publisher = gets.chomp
    puts 'Choose cover_state Good/Bad/Average: '
    cover_state = gets.chomp
    if cover_state.downcase != 'good' && cover_state.downcase != 'bad' && cover_state.downcase != 'average'
      puts 'Choose correct cover_state Good/Bad: '
      cover_state = gets.chomp
    end; puts
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    puts 'Enter label color: '
    color = gets.chomp
    book = Book.new(publisher: publisher, cover_state: cover_state.downcase, publish_date: publish_date)
    label = Label.new(title: title.capitalize, color: color)
    book.assign_label(label)
    @list_of_books << book
    puts 'Book created!'
    store_books_with_labels
  end

  def add_a_game
    puts
    puts 'Enter first name of author: '
    first_name = gets.chomp
    puts 'Enter last name of author: '
    last_name = gets.chomp
    puts 'Is the game multiplayer? (y/n): '
    multiplayer_input = gets.chomp
    multiplayer = multiplayer_input.downcase == 'y' ? 'yes' : 'no'
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    puts 'Enter last played date (YYYY-MM-DD):'
    last_played_at = gets.chomp
    puts
    game = Game.new(multiplayer: multiplayer, last_played_at: last_played_at, publish_date: publish_date)
    author = Author.new(first_name: first_name, last_name: last_name)
    game.assign_author(author)
    @list_of_games << game
    puts 'Game created!'
    puts
    store_games_with_authors
  end

  def add_a_music_album
    puts
    puts 'Enter publish date (YYYY-MM-DD): '
    publish_date = gets.chomp
    puts
    puts 'Is this album on spotify? (y/n): '
    on_spotify_input = gets.chomp
    on_spotify_input = on_spotify_input.downcase! if on_spotify_input == 'Y'
    on_spotify = on_spotify_input == 'y'
    puts
    puts 'Enter genre of album: '
    genre_name = gets.chomp
    puts
    music_album = MusicAlbum.new(on_spotify: on_spotify, publish_date: publish_date)
    genre = Genre.new(name: genre_name.capitalize)
    music_album.assign_genre(genre)
    @list_of_music_albums << music_album
    puts 'Music album created!'
    store_music_albums_with_genres
  end

  def exit
    abort
  end

  private

  def store_books_with_labels
    books_data = @list_of_books.map do |book|
      { publish_date: book.publish_date, publisher: book.publisher, cover_state: book.cover_state,
        label: [{ title: book.label.title, color: book.label.color }] }
    end
    @store.write_file('book.json', books_data)
  end

  def store_games_with_authors
    game_data = @list_of_games.map do |game|
      { multiplayer: game.multiplayer, last_played_at: game.last_played_at, publish_date: game.publish_date,
        author: [{ first_name: game.author.first_name, last_name: game.author.last_name }] }
    end
    @store.write_file('game.json', game_data)
  end

  def store_music_albums_with_genres
    music_album_data = @list_of_music_albums.map do |album|
      { publish_date: album.publish_date, on_spotify: album.on_spotify, genre: [name: album.genre.name] }
    end
    @store.write_file('music_album.json', music_album_data)
  end
end
