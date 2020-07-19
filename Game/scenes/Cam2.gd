extends Camera2D
class_name MainCamera

const MONITOR_H = 1280
const MONITOR_V = 720

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

func _ready():
	print(self.position, " e ", self.global_position)

func _unhandled_input(event: InputEvent):
	if event is InputEventMouseButton && event.button_index == BUTTON_LEFT:
		get_tree().set_input_as_handled();
		if event.is_pressed():
			_previousPosition = event.position;
			_moveCamera = true;
		else:
			_moveCamera = false;
	elif event is InputEventMouseMotion && _moveCamera:
		get_tree().set_input_as_handled();
		position += (_previousPosition - event.position);
		position.x = max(min(position.x, limit_right - MONITOR_H/2), limit_left + MONITOR_H/2)
		position.y = max(min(position.y, limit_top + MONITOR_V/2), limit_bottom - MONITOR_V/2)
		#print(position)
		_previousPosition = event.position;
	elif event is InputEventKey and event.scancode == KEY_F and !self.is_current():
		self.make_current()


func mover_ativo():
	_moveCamera = true
	
func mover_inativo():
	_moveCamera = false

func defasagem():
	if self.is_current():	
		print("==> ", self.get_camera_position())
		get_tree().set_group("scroll", "defasagem", self.get_camera_position() - Vector2(MONITOR_H/2, MONITOR_V/2))
	else:
		get_tree().call_group("camera1", "defasagem")
