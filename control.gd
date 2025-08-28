extends Control

func _on_level_1_button_down() -> void:
	# 切换到第一关场景
	get_tree().change_scene_to_file("res://level_1.tscn")
	pass # Replace with function body.


func _on_level_2_button_down() -> void:
	get_tree().change_scene_to_file("res://level_2.tscn")
	pass # Replace with function body.


func _on_level_3_button_down() -> void:
	get_tree().change_scene_to_file("res://level_3.tscn")
	pass # Replace with function body.
