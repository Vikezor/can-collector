extends Camera2D

@onready var TargetNode = get_parent().get_node("Teekkari")

func _process(_delta):
	position.x = TargetNode.position.x
