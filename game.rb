require './person.rb'

class Game
  def start
    puts '=========BlackJack========'
    puts '# Initial hand'
  end

  def check_score(score)

  end

  def show_result(player, dealer)
    puts '# result'
    player.show_hand
    dealer.show_hand

    result = result_judge(player, dealer)

    if result == 1
      puts 'You Win!'
    elsif result == -1
      puts 'You Lose...'
    else
      puts 'Draw'
    end
  end

  # 結果判定
  # win: 1 lose: -1 draw: 0
  def result_judge(player, dealer)
    if player.score > 21
      return -1
    end

    if player.score > dealer.score
      return 1
    elsif player.score < dealer.score
      return -1
    end

    if player.num_of_cards > dealer.num_of_cards
      return 1
    elsif player.num_of_cards < dealer.num_of_cards
      return -1
    end

    return 0
  end

  def end_game
    puts '=========================='
    exit
  end
end