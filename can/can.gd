extends Area2D


var in_air = false

func _on_area_entered(area):
	if in_air and area is Bag:
		(area as Bag).can_collected.emit(get_parent())


func _on_can_body_entered(body):
	if body.name == "Ground":
		in_air = false


func _on_can_body_exited(body):
	if body.name == "Ground":
		in_air = true
