require './game.rb'
require './stack.rb'
require './person.rb'

# ゲームオブジェクト作成, ゲーム開始
game = Game.new
game.start

# 山札作成
stack = Stack.new

# プレーヤー, ディーラー作成
# 山札から二枚配布する
player = Player.new(stack.pull_out(2))
dealer = Dealer.new(stack.pull_out(2))

# 手札開示 (ディーラーは片方のみ)
player.show_hand
dealer.show_ini_hand

# ブラックジャックの場合, 自動で勝負に出る
if player.score === 21
  game.show_result(player, dealer)
  game.end_game
end

# standを希望するまで引く
while player.hit?
  player.hit(stack.pull_out(1))
end

# dialerのターン
while dealer.hit?
  dealer.hit(stack.pull_out(1))
end

# 結果発表, ゲーム終了
game.show_result(player, dealer)
game.end_game