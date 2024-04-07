extends Camera2D

@onready var TargetNode = get_parent().get_node("Teekkari")
var over = false

func _process(_delta):
	position.x = TargetNode.position.x


func _on_teekkari_torso_hit():
	$End.visible = true
	over = true


func _input(event):
	if over and event.is_action_pressed("Restart"):
		get_tree().change_scene_to_file("res://main.tscn")
