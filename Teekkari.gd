extends RigidBody2D


@onready var mouse_pos: Vector2 = get_viewport().get_mouse_position()
@onready var shoulder_pos: Vector2 = get_viewport_coordinates($Arm/CollisionShape2D/Shoulder)
@onready var hand_pos: Vector2 = get_viewport_coordinates($Arm/CollisionShape2D/Marker2D)
@onready var mouse_angle = shoulder_pos.angle_to_point(mouse_pos)
@onready var arm_angle = shoulder_pos.angle_to_point(hand_pos)
@onready var diff = mouse_angle - arm_angle


func get_viewport_coordinates(node: Node2D):
	return node.get_viewport().get_screen_transform() * node.get_global_transform_with_canvas() * node.position


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	shoulder_pos = get_viewport_coordinates($Arm/CollisionShape2D/Shoulder)
	hand_pos = get_viewport_coordinates($Arm/CollisionShape2D/Marker2D)
	var target_velocity = 0
	if Input.is_action_pressed("MoveLeft"):
		target_velocity += 200
	if Input.is_action_pressed("MoveRight"):
		target_velocity += -200
	if target_velocity != 0:
		$Pelvis.motor_enabled = true
		$Pelvis.motor_target_velocity = target_velocity
	else:
		$Pelvis.motor_enabled = false

	mouse_angle = shoulder_pos.angle_to_point(mouse_pos)
	arm_angle = shoulder_pos.angle_to_point(hand_pos)
	diff = mouse_angle - arm_angle
	if abs(diff) >= PI:
		diff += (2 * PI * -sign(diff))
	$Arm/CollisionShape2D/Shoulder.motor_target_velocity = 360 / PI * diff


func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position
