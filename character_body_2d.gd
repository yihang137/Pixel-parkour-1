extends CharacterBody2D

@export var speed := 50
var direction := 1   # 1 向右，-1 向左

func _physics_process(delta):
	velocity.x = direction * speed
	velocity.y = 0
	move_and_slide()

	# 碰到墙就换方向
	if is_on_wall():
		direction *= -1
		$Sprite2D.flip_h = direction < 0  # 翻转贴图
