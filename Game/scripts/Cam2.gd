extends Camera2D
class_name MainCamera

const MONITOR_H = 1280
const MONITOR_V = 720

var _previousPosition: Vector2 = Vector2(0, 0);
var _moveCamera: bool = false;

onready var objeto = $Pivot
var pai_objeto
var dist

func _ready():
	
	dist = get_tree().get_nodes_in_group("dist")[0]
	dist.cam = self
	
	for no in get_tree().get_nodes_in_group("definicoes"):
		self.limit_left = no.limite_esq
		self.limit_right = no.limite_dir
		self.limit_top = no.limite_cima
		self.limit_bottom = no.limite_baixo
	
	for no in get_tree().get_nodes_in_group("player"):
		pai_objeto = no
		
	print(objeto)
	print(pai_objeto)
	self.remove_child(objeto)
	pai_objeto.add_child(objeto)
	objeto.set_owner(pai_objeto)
	
	
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
		_previousPosition = event.position;
	elif event is InputEventKey and event.scancode == KEY_F and !self.is_current():
		self.make_current()
		dist.cam = self


func mover_ativo():
	_moveCamera = true
	
func mover_inativo():
	_moveCamera = false

func defasagem():
	if self.is_current():	
		get_tree().set_group("scroll", "defasagem", self.get_camera_position() - Vector2(MONITOR_H/2, MONITOR_V/2))
	else:
		get_tree().call_group("camera1", "defasagem")
