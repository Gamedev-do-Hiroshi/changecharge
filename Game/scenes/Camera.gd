extends Camera2D

const MONITOR_H = 1280
const MONITOR_V = 720


func _ready():
	set_process_input(true)
	
	

func _input(event):
	if event is InputEventKey and event.scancode == KEY_G and !self.is_current():
		self.make_current()
		
func defasagem():
	get_tree().set_group("scroll", "defasagem", self.get_camera_position() - Vector2(MONITOR_H/2, MONITOR_V/2))


