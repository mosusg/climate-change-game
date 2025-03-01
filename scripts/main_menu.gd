extends Node2D



func _on_startButton_pressed() -> void:
	get_tree().change_scene_to_file("res://newScenes/main.tscn")



func _on_exitButton_2_pressed() -> void:
	get_tree().quit()
