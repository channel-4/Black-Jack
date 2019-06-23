class Person
  def initialize(ini_hand)
    @name
    @hand = ini_hand
    @score = 0
    @sub_score = 0
    # 2枚初期で引かれるのでセットする
    setScore
  end

  attr_reader :score

  # 手札開示
  def show_hand
    # ex) Player: 4, Q
    print "#{@name} : #{@hand.join(', ')}"

    # スコア出力 (subが存在する場合は2つ出力)

    # ex) - score: 13
    print " - score: #{@score}"

    if @sub_score != 0
       # ex) - score: 19(9) 2 pattern
       print "(#{@sub_score}) 2 pattern"
    end

    # 改行挟める
    puts ''
  end

  # 点数更新 (Aがある場合で11点が可能な場合は2パターン返す)
  def setScore

    # 計算するにあたりマークは落とす
    # ex) ['♤2', '♡Q'... ] => [2, Q]
    hand_only_num = []
    @hand.each do |n|
      hand_only_num << n.slice(1..2)
    end

    # Aが1枚以上存在するとき(index: 要素位置)
    if index = hand_only_num.index('A')
      # 削除
      hand_only_num.delete_at(index)
      # 末尾に追加(=> 計算用に実質的に末尾に移動させる)
      hand_only_num.push('A')
    end

    # sum: 通常時のスコア, sub: 2パターン存在する場合の片方のスコア
    sum = 0
    sub = 0
    # 手札のカードを1枚ずつチェックして加算
    hand_only_num.each_with_index do |card, index|
      # 10点換算軍
      if card == 'J' || card == 'Q' || card == 'K'
        card = '10'
      end

      # Aは1点か11点
      if card == 'A'
        # 基本1点換算
        card = '1'

        # 配列の末尾のAかつoverしない場合は11点採用
        # Playerが1点のパターンの合計を把握しやすいようにsubスコアも準備
        if hand_only_num.length-1 == index && sum + 11 <=  21
          card = '11'
          sub = sum + 1
        end
      end
      sum += card.to_i
    end

    @score = sum
    @sub_score = sub
  end

  def num_of_cards
    return @hand.length
  end

  def hit(card)
    # 一枚追加
    @hand.push(card.join(''))
    # 点数更新
    setScore
    # 手札開示(コンソール出力)
    show_hand
  end
end

class Player < Person
  def initialize(ini_hand)
    super
    @name = 'Player'
  end

  # hitの希望を募る
  def hit?
    # 21点超えてる場合は必ずfalse
    return false if @score >= 21

    # hitするかしないか促す
    puts ''
    print 'hit? (Type "1" and push Enter) : '

    input = gets
    # タイプされた値取得 1ならtrue
    if input.chomp! == '1'
      return true
    end
    return false
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
    print "#{@name} : #{@hand[0]}, *"
    puts " - score: *"
  end

  def hit?
    puts ''
    # 17点超えてる場合は必ずfalse
    return false if @score >= 17
    return true
  end

  def hit (card)
    puts '# Dealer Hit'
    super(card)
  end
end