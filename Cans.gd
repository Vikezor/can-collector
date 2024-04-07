extends Node2D


func _on_area_2d_body_entered(body):
	if body is Can:
		var can_scene = preload("res://can/can.tscn")
		var can = can_scene.instantiate()
		can.position = Vector2(get_parent().get_node("Teekkari").position.x + 1600, 600)
		add_child(can)
