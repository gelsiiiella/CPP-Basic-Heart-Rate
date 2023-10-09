extends Camera2D

var maxHeartRate : int=200
var minHeartRate : int= 40
var heartRate : int=0

var camera_feed:CameraFeed
# Called when the node enters the scene tree for the first time.
func _ready():
	camera_feed = CameraFeed.new()
	camera_feed.open(0)
	
func process_heart_rate(signal_value):
	heartRate += randi_range(-5,5)
	heartRate = clamp(heartRate,minHeartRate,maxHeartRate)
	print("Heart Rate:",heartRate)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var signal_value = randf() * 100
	process_heart_rate(signal_value)
	
func _exit_tree():
	camera_feed.close()
