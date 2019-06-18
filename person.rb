class Person
  def initialize(ini_hand)
    @name
    @hand = ini_hand
  end

  # 手札開示
  def show_hand
    # ex) Player: 4, Q
    puts "#{@name} : #{@hand.join(', ')}"
  end

  # 点数計算
  # TODO Aが一枚の想定なので山札が増えた場合変更しなければならない
  def score
    # 計算用に操作するのでコピー
    hand = @hand
    # Aが存在するとき(index: 要素位置)
    if index = hand.index('A')
      # 削除
      hand.delete_at(index)
      # 末尾に追加
      hand.push('A')
    end

    sum = 0
    hand.each do |card|
      # 10点換算
      if card == 'J' || card == 'Q' || card == 'K'
        card = '10'
      end

      # より点数が近い方を採用する
      if card == 'A'
        # 11点換算した時に21点超えてた場合1点採用
        # 違う場合は11点換算で計算
        (sum + 11 > 21) ? card = '1' : card = '11'
      end
      sum += card.to_i
    end

    puts "- score: #{sum}"
  end
end

class Player < Person
  def initialize(ini_hand)
    super
    @name = 'Player'
  end
end

class Dealer < Person
  def initialize(ini_hand)
    super
    @name = 'Dealer'
  end

  # ディラーの初期の手札開示は片方のみ, 点数は公開しない
  def show_ini_hand
    # ex) Dealer : 4, *
    puts "#{@name} : #{@hand[0]}, *"
    puts "- score: *"
  end
end