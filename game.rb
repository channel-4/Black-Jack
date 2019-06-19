require './person.rb'

class Game
  def start
    puts '=========BlackJack========'
    puts '# Initial hand'
  end

  def show_result(player, dealer)
    # ディーラーが17超えるまでhit
    # dealer.stand_or_hit

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
    # 21点超えは負け確定
    if player.score > 21
      return -1
    end

    # playerが21以内でディーラーがバーストした場合勝ち
    if dealer.score > 21
      return 1
    end

    # スコア比較
    if player.score > dealer.score
      return 1
    elsif player.score < dealer.score
      return -1
    end

    # スコアで決着がつかない場合は枚数比較
    if player.num_of_cards < dealer.num_of_cards
      return 1
    elsif player.num_of_cards > dealer.num_of_cards
      return -1
    end

    # 枚数すら被った場合はドロー
    return 0
  end

  def end_game
    puts '=========================='
    exit
  end
end