extends Node

var can = preload("res://can.tscn")

var spawnInterval_min = 2.0
var spawnInterval_max = 6.5

@onready var nextSpawnTime = randf_range(spawnInterval_min, spawnInterval_max) * 1000
@onready var previousSpawnTime = Time.get_ticks_msec()

func _process(delta):
	if(Time.get_ticks_msec() > nextSpawnTime):
		nextSpawnTime = Time.get_ticks_msec() + randf_range(spawnInterval_min, spawnInterval_max) * 1000
		spawnCan(Vector2(2, 1))

func spawnCan(pos):
	var obj = can.instantiate()
	obj.position = pos
	add_child(obj)
