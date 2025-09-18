extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):   # 玩家要在 group 里
		body.die()
