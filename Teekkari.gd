extends RigidBody2D


signal can_collected()


@onready var mouse_pos: Vector2 = get_viewport().get_mouse_position()
@onready var shoulder_pos: Vector2 = get_viewport_coordinates($Arm/Shoulder)
@onready var hand_pos: Vector2 = get_viewport_coordinates($Arm/Marker2D)
@onready var desired_angle = shoulder_pos.angle_to_point(mouse_pos)
@onready var arm_angle = shoulder_pos.angle_to_point(hand_pos)
@onready var diff = desired_angle - arm_angle
var attached_bodies = []
var right_stick = Vector2()
var mouse_active = true


func get_viewport_coordinates(node: Node2D):
	return node.get_viewport().get_screen_transform() * node.get_global_transform_with_canvas() * node.position


func attach(node: Node2D):
	if node is RigidBody2D and not attached_bodies.has(node):
		node.reparent($Arm)
		node.freeze = true
		attached_bodies.append(node)
	return true


func detach(node: Node2D):
	node.freeze = false
	attached_bodies.erase(node)
	return true


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	shoulder_pos = get_viewport_coordinates($Arm/Shoulder)
	hand_pos = get_viewport_coordinates($Arm/Marker2D)
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
	
	if mouse_active:
		desired_angle = shoulder_pos.angle_to_point(mouse_pos)
	arm_angle = shoulder_pos.angle_to_point(hand_pos)
	diff = desired_angle - arm_angle
	if abs(diff) >= PI:
		diff += (2 * PI * -sign(diff))
	$Arm/Shoulder.motor_target_velocity = 100 * diff

	if Input.is_action_just_pressed("PickUp"):
		var bodies = $Arm/Area2D.get_overlapping_bodies()
		bodies.all(attach)
	if Input.is_action_just_released("PickUp"):
		attached_bodies.all(detach)


func use_right_stick():
	mouse_active = false
	desired_angle = right_stick.angle()


func _input(event):
	if event is InputEventMouseMotion:
		mouse_pos = event.position
		mouse_active = true
	if event is InputEventJoypadMotion:
		if event.axis == JOY_AXIS_RIGHT_X:
			right_stick.x = event.axis_value
			use_right_stick()
		elif event.axis == JOY_AXIS_RIGHT_Y:
			right_stick.y = event.axis_value
			use_right_stick()


func _on_bag_can_collected(can: Node):
	attached_bodies.erase(can)
	can.queue_free()
	can_collected.emit()
