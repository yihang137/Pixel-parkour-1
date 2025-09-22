extends CharacterBody2D

@export var speed: float = 120          # 左右移动速度
@export var jump_force: float = 335     # 跳跃初速度
@export var gravity: float = 1200       # 重力
@export var fall_multiplier: float = 1.5  # 下落加速，让跳跃自然

var respawn_position: Vector2   # 出生点

func _ready() -> void:
	respawn_position = global_position
	add_to_group("player")   # 玩家加入组，方便死亡线识别

func _physics_process(delta: float) -> void:
	var direction := 0
	if Input.is_action_pressed("move_left"):
		direction -= 1
	if Input.is_action_pressed("move_right"):
		direction += 1

	velocity.x = direction * speed

	# 翻转角色方向
	if direction != 0:
		$AnimatedSprite2D.flip_h = direction < 0  # 左移 flip_h = true，右移 flip_h = false

	# 跳跃
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = -jump_force

	# 重力与下落加速
	if not is_on_floor():
		if velocity.y > 0:  # 下落
			velocity.y += gravity * fall_multiplier * delta
		else:               # 上升
			velocity.y += gravity * delta

	move_and_slide()

func die() -> void:
	global_position = respawn_position
	velocity = Vector2.ZERO

func _on_死亡_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.die()
