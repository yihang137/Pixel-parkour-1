extends Area2D

var coins := 0

func _on_body_entered(body):
	if body.is_in_group("player"):
		var coin_manager = get_node("/root/Node2D/金币")
		coin_manager.coins += 1
		queue_free()
