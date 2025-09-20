extends Area2D

func _on_body_entered(body):
	if body.is_in_group("player"):   # 玩家触碰到金币
		金币.coins += 1            # 金币数 +1
		queue_free()                 # 金币消失
