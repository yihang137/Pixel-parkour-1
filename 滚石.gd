extends CharacterBody2D

@export var speed: float = 1000
var direction: int = 1  # 1 向右，-1 向左

func _physics_process(delta):
	# 设置水平速度
	velocity.x = direction * speed
	velocity.y = 0  # 不下落

	# 移动
	move_and_slide()

	# 碰到墙反向
	if is_on_wall():
		direction *= -1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.die()
