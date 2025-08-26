extends CharacterBody2D

@export var speed: float = 200          # 水平移动速度
@export var jump_force: float = 400     # 跳跃初速度
@export var gravity: float = 1200       # 重力
@export var fall_multiplier: float = 1.5  # 下落加速，让跳跃自然

func _physics_process(delta: float) -> void:
	var direction := 0
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1

	velocity.x = direction * speed

	# 跳跃
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# 重力与下落加速
	if not is_on_floor():
		if velocity.y > 0:  # 正在下落
			velocity.y += gravity * fall_multiplier * delta
		else:  # 上升
			velocity.y += gravity * delta

	move_and_slide()
