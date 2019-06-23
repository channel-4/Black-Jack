class Stack

  # 山札定義
  def initialize
    mark = %w[ ♤ ♧ ♡ ♢ ]
    num  = %w[ A 2 3 4 5 6 7 8 9 10 J Q K ]

    # markとnumの直積を求める => 52枚のカード
    # そしてそれをシャッフルすることで山札を定義する
    @stack = mark.product(num).collect {|set| set.join('')}.shuffle
  end

  # 山からnum枚分だけ引かれる
  def pull_out(num)
    @stack.shift(num)
  end
end