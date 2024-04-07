extends Node2D


const spacing = 400
var next = spacing
@onready var teekkari = get_parent().get_node("Teekkari")


func _process(_delta):
	if teekkari.position.x > next:
		var can_scene = preload("res://can/can.tscn")
		var can = can_scene.instantiate()
		can.position = Vector2(get_parent().get_node("Teekkari").position.x + 800, 600)
		add_child(can)
		next += spacing
