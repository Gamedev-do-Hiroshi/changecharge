extends Camera2D

func _ready():
	set_process_input(true)

func _input(event):
	if event is InputEventKey and event.scancode == KEY_G and !self.is_current():
		self.make_current()
		
