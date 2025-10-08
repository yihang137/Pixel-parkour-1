extends CanvasLayer

# 可调的计算参数
var base_score := 100
var coin_value := 100
var death_penalty := 1000
var time_penalty := 2.0

# 游戏数据
var time_elapsed := 0.0
var score := 0
var coins := 0 

@onready var coin_node = get_node("/root/Node2D/金币")    # “金币”是存 coins 的节点
@onready var player_node = get_node("/root/Node2D/role")  # “Player” 是角色节点

func _process(delta):
	# 时间累加
	time_elapsed += delta

	# 计算分数
	score = base_score + int(time_elapsed * 1) + (coin_node.coins * coin_value) - (player_node.deaths * death_penalty)

	if has_node("CoinLabel"):
		var coin_manager = get_node("/root/Node2D/金币")
		$CoinLabel.text = "Coins: " + str(coin_manager.coins)
		
	if has_node("ScoreLabel"):
		$ScoreLabel.text = "Score: " + str(score)
