class SelectOption
  def options(app)
    options_hash = {
      '1' => :list_all_books,
      '2' => :list_all_music_albums,
      '3' => :list_all_games,
      '4' => :list_all_geners,
      '5' => :list_all_labels,
      '6' => :list_all_authors,
      '7' => :add_a_book,
      '8' => :add_a_music_album,
      '9' => :add_a_game,
      '10' => :exit
    }
    input = gets.chomp
    if options_hash.key?(input)
      app.send(options_hash[input])
    else
      puts 'Invalid input! please enter correct number.'
    end
  end
end
