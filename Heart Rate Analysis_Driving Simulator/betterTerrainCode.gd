extends Node3D

var parts = {}
# Called when the node enters the scene tree for the first time.
func _ready():
	prepare_road()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func prepare_road():
	var path = "res://road"
	var dir = DirAccess.open(path)
	if dir == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if !dir.current_is_dir():
				var part = {
						file = path + "/" + file_name,
						type = file_name.split('_')[0]
					}
				file_name = dir.get_next()
	else:
		print("betterTerrainCode.gd: error loading res://road/*")
		
func spawn_part(index):
	randomize()
	
	var part = parts
