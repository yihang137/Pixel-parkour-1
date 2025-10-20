extends Node2D

func _ready():
	# 隐藏胜利文字
	$WinLabel.visible = false
	# 连接信号
	$GoalArea.connect("player_won", Callable(self, "_on_player_won"))

func _on_player_won():
	$WinLabel.text = "YOU WIN!"
	$WinLabel.visible = true

	# 延迟几秒返回主菜单
	await get_tree().create_timer(1).timeout
	get_tree().change_scene_to_file("res://control.tscn")

func _on_goal_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		$WinLabel.text = "YOU WIN!"
		$WinLabel.visible = true
		await get_tree().create_timer(2).timeout
		get_tree().change_scene_to_file("res://control.tscn")
