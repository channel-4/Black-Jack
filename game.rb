class Game
  def start
    puts '=========BlackJack========'
    puts '(key) 1: start, other: end'
    puts '=========================='

    input = gets
    if input.chomp! == '1'
      puts 'welcome!'
    else
      puts 'exit'
      end_game
    end
  end

  def end_game
    exit
  end
end