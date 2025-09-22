extends CharacterBody2D

@export var speed: float = 100
var direction: int = 1


func _ready() -> void:
	add_to_group("enemy") 
	
func _physics_process(delta):
	# 设置水平速度
	velocity.x = direction * speed
	velocity.y = 0

	# 移动
	move_and_slide()

	# 碰到墙壁反向
	if is_on_wall():
		direction *= -1


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.die()
