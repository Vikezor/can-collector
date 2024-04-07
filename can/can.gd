extends Area2D


func _on_area_entered(area):
	if area is Bag and not get_parent().get_colliding_bodies().any(func(node): return node.name == "Ground"):
		(area as Bag).can_collected.emit(get_parent())
