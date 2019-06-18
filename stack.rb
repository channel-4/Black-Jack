class Stack
  # 山札定義
  def initialize
    @stack = %w[
    A 2 3 4 5 6 7 8 9 10 J Q K
    ].shuffle
  end

  # 山からnum枚分だけ引かれる
  def pull_out(num)
    @stack.shift(num)
  end
end