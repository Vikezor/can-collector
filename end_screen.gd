extends Control

func _on_menu_button_pressed():
	print("Navigate to main menu")
	get_tree().change_scene_to_file("res://main.tscn")
