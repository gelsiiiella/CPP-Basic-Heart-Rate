extends Node2D


var ui_scene_instance = preload("res://user_interface/User Interface.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var ui_node = ui_scene_instance.instance()  # Instantiate the UI scene
	add_child(ui_node)  # Add the UI scene as a child

	# Access the exported variables (speed and score labels)
	var speed_label = ui_node.get_node("SpeedLabel")  # Adjust the path to your label
	var score_label = ui_node.get_node("ScoreLabel")  # Adjust the path to your label


