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
player.score
dealer.show_ini_hand
# 降りるまで引く

# 勝負!

# 山札開示, 勝ち判定

# ゲーム終了
