extends Area2D

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player") or body.is_in_group("enemy"):
		body.die()
