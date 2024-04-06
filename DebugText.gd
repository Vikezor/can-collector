extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	text = "Mouse: {x}, {y}\n
	Shoulder: {dx}, {dy}\n
	Hand: {hx}, {hy}\n
	Mouse angle: {ma}\n
	Arm angle: {aa}\n
	Difference: {d}".format([
		["x", $Teekkari.mouse_pos.x],
		["y", $Teekkari.mouse_pos.y],
		["dx", $Teekkari.shoulder_pos.x],
		["dy", $Teekkari.shoulder_pos.y],
		["hx", $Teekkari.hand_pos.x],
		["hy", $Teekkari.hand_pos.y],
		["ma", $Teekkari.mouse_angle],
		["aa", $Teekkari.arm_angle],
		["d", $Teekkari.diff]])
	
