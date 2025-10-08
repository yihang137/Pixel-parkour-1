extends CanvasLayer

# 可调的计算参数
var base_score := 1000
var coin_value := 10
var death_penalty := 50
var time_penalty := 2.0

# 游戏数据
var time_elapsed := 0.0
var score := 0

@onready var coin_node = get_node("res://金币.tscn")    # “金币”是存 coins 的节点
@onready var player_node = get_node("res://role.tscn")  # “Player” 是角色节点

func _process(delta):
	# 时间累加
	time_elapsed += delta

	# 计算分数
	score = int(base_score + (coin_node.coins * coin_value) - (time_elapsed * time_penalty) - (player_node.deaths * death_penalty))

	if has_node("CoinLabel"):
		$CoinLabel.text = "Coins: " + str(金币.coins)
		
	if has_node("ScoreLabel"):
		$ScoreLabel.text = "Score: " + str(score)

var coins: int = 0
