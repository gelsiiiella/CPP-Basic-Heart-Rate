extends Node3D
class_name TerrainController

# Called when the node enters the scene tree for the first time.
var RoadBlocks:Array = []
var terrain_belt: Array[MeshInstance3D] = []
@export var terrain_vel: float = 10
@export var terrain_blocks = 6
@export_dir var terrain_blocks_path = "res://road"
func _ready() -> void:
	_load_terrain_scenes(terrain_blocks_path)
	_init_blocks(terrain_blocks)

func _physics_process(delta: float) -> void:
	_progress_terrain(delta)


func _init_blocks(number_of_blocks: int) -> void:
	for block_index in number_of_blocks:
		var block = RoadBlocks.pick_random().instantiate()
		print("Block: " , block , "Index: " , block_index)
		if block_index == 0:
			block.position.z = block.mesh.size.y/2
		else:
			_append_to_far_edge(terrain_belt[block_index-1], block)
		add_child(block)
		terrain_belt.append(block)


func _progress_terrain(delta: float) -> void:
	for block in terrain_belt:
		block.position.z += terrain_vel * delta

	if terrain_belt[0].position.z >= terrain_belt[0].mesh.size.y/2:
		var last_terrain = terrain_belt[-1]
		var first_terrain = terrain_belt.pop_front()

		var block = RoadBlocks.pick_random().instantiate()
		_append_to_far_edge(last_terrain, block)
		add_child(block)
		terrain_belt.append(block)
		first_terrain.queue_free()


func _append_to_far_edge(target_block: MeshInstance3D, appending_block: MeshInstance3D) -> void:
	appending_block.position.z = target_block.position.z - target_block.mesh.size.y/2 - appending_block.mesh.size.y/2

func _load_terrain_scenes(target_path: String) -> void:
	var dir = DirAccess.open(target_path)
	for scene_path in dir.get_files():
		print("Loading terrian block scene: " + target_path + "/" + scene_path)
		RoadBlocks.append(load(target_path + "/" + scene_path))
