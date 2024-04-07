extends Label


var score = 0

func _on_teekkari_can_collected():
	score += 1
	text = "Cans: {cans}".format({"cans": score})
