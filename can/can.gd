extends Area2D


func _on_area_entered(area):
	if area is Bag:
		(area as Bag).can_collected.emit(get_parent())
