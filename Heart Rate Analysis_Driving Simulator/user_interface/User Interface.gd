extends Control

@onready var game_manager = preload("res://game_manager.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	game_manager.connect("update_ui",self,"_on_update_ui")

func _on_update_ui(new_speed: int, new_distance: int):
	$Physics/Speed.text = str(new_speed)
	$Physics/Distance.text = str(new_distance) + "km"

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
