extends Camera2D

const MONITOR_H = 1280
const MONITOR_V = 720

var dist

func _ready():
	
	dist = get_tree().get_nodes_in_group("dist")[0]
	
	for no in get_tree().get_nodes_in_group("definicoes"):
		self.limit_left = no.limite_esq
		self.limit_right = no.limite_dir
		self.limit_top = no.limite_cima 
		self.limit_bottom = no.limite_baixo
		
		
	set_process_input(true)
	
	

func _input(event):
	if event is InputEventKey and event.scancode == KEY_G and !self.is_current():
		self.make_current()
		dist.cam = self
		
func defasagem():
	get_tree().set_group("scroll", "defasagem", self.get_camera_position() - Vector2(MONITOR_H/2, MONITOR_V/2))


