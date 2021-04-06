extends Label

var MAXV = 720
var MAXH = 1280
var MINV = 0
var MINH = 0

var player
var dist = Vector2()
var aux = Vector2()
var cam

func _ready():
	player = get_tree().get_nodes_in_group("player")[0]
	self.visible = false
#	for no in get_tree().get_nodes_in_group("definicoes"):
#		MINH = no.limite_esq
#		MAXH = no.limite_dir
#		MINV = no.limite_cima
#		MAXV = no.limite_baixo

func _process(delta):
	if cam != null:
		mostra()

func mostra():
	dist =  player.global_position - cam.get_camera_screen_center() + Vector2(MAXH, MAXV)/2.0
	aux = dist
	
	dist.x = min(dist.x, MAXH)
	dist.x = max(dist.x, MINH)
	dist.y = min(dist.y, MAXV)
	dist.y = max(dist.y, MINV)
	
	if (dist - aux).length() != 0.0:
		self.text = String(int((dist - aux).length()))
		
		dist.x = min(dist.x, MAXH - 50)
		dist.x = max(dist.x, MINH + 50)
		dist.y = min(dist.y, MAXV - 30)
		dist.y = max(dist.y, MINV + 30)
	
		self.rect_position = dist
		self.visible = true
	else:
		self.visible = false
		
		
	
	
	
	
