extends Node

var speed: int = 0
var distance: int = 0

signal update_ui(speed: int, distance: int)

func updateSpeedAndDistance(new_speed: int, new_distance:int):
	speed = new_speed
	distance = new_distance
	emit_signal("update_ui",speed, distance)
	
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
