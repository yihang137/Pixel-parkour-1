extends RigidBody2D

func _ready():
	# 给一个初始角速度，让它开始摇摆
	angular_velocity = 2.0  # 数值越大，开始摇的越快
