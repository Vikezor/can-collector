extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mouse_pos = get_viewport().get_mouse_position()
	var teekkari_pos = get_viewport().get_screen_transform() * get_global_transform_with_canvas() * $Teekkari.position
	text = "Mouse: {x}, {y}\n
	Dude: {dx}, {dy}\n
	Angle: {a}".format([["x", mouse_pos.x], ["y", mouse_pos.y], ["dx", teekkari_pos.x], ["dy", teekkari_pos.y], ["a", teekkari_pos.angle_to_point(mouse_pos)]])
	
