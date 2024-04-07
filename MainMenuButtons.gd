extends Panel

func _on_start_button_pressed():
	print("Start game")
	get_tree().change_scene_to_file("res://main.tscn")

func _on_exit_button_pressed():
	print("Exit game")
	get_tree().quit()
