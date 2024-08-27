extends CPUParticles2D

func _process(delta):
	if Input.is_action_just_released("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/start_menu.tscn")
