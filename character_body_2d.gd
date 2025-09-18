extends CharacterBody2D

@export var speed: float = 60.0
var direction: int = 1   # 初始向右

func _physics_process(delta: float) -> void:
	velocity.x = direction * speed
	move_and_slide()

	# 翻转 sprite
	if $Sprite2D:
		$Sprite2D.flip_h = direction < 0

	# 检测：前方有墙 或 前方没地面 → 掉头
	if $RayCast2D.is_colliding() or not $RayCast2D2.is_colliding():
		direction *= -1
