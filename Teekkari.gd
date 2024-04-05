extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_pressed("MoveLeft"):
		$Pelvis.motor_target_velocity = 200
		$Pelvis.motor_enabled = true
	elif Input.is_action_pressed("MoveRight"):
		$Pelvis.motor_target_velocity = -200
		$Pelvis.motor_enabled = true
	else:
		$Pelvis.motor_enabled = false
