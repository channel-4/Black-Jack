require 'minitest/autorun'
require './person.rb'
require './game.rb'

class BlackJackTest < Minitest::Test
  def setup
    @player1 = Player.new(%w[♡5, ♧3, ♧A]) #19
    @dealer1 = Dealer.new(%w[♧5, ♡3, ♧8, ♧2]) #19

    @player2 = Player.new(%w[♡5, ♧3, ♧A])
    @dealer2 = Dealer.new(%w[♧5, ♡3, ♡A])

    @player3 = Player.new(%w[♡5, ♡7, ♧3, ♧8]) #23
    @dealer3 = Dealer.new(%w[♡5, ♧7, ♡3, ♡9]) #23
  end

  # 正しい勝者が選出されるかテスト
  def test_winner
    game = Game.new

    # 同じ点数で、違う枚数の場合をチェック (playerの勝ち)
    assert_equal game.result_judge(@player1, @dealer1), 1

    # 引き分けチェック
    assert_equal game.result_judge(@player2, @dealer2), 0

    # 引き分けでもoverした場合は負けるかチェック
    assert_equal game.result_judge(@player3, @dealer3), -1
  end
end