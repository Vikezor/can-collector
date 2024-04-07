extends RigidBody2D
	

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprites/Can01.visible = false
	var sprites = $Sprites.get_children()
	var i = randi() % 4
	sprites[i].visible = true
