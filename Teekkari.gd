extends Node2D


@onready var pelvis = $Skeleton/Torso/Legs/Pelvis

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var target_velocity = 0
	if Input.is_action_pressed("MoveLeft"):
		target_velocity += 200
	if Input.is_action_pressed("MoveRight"):
		target_velocity += -200
	if target_velocity != 0:
		pelvis.motor_enabled = true
		pelvis.motor_target_velocity = target_velocity
	else:
		pelvis.motor_enabled = false
	
