extends TextureButton

export var number = 1;
const cima = 100
const baixo = 170
const esq = 136
const dir = 264
const espacoV = (720 - cima - baixo - 3*128)/2
const espacoH = (1280 - esq - dir - 5*128)/4
const vel = 500
var real_position_x
var real_position_y
var must_be_position_x
var must_be_position_y
var move = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Label").text = str(number)
	self.rect_position.x = 1500
	self.rect_position.y = 296
	
	must_be_position_x = esq + ((number-1)%5)*(128 + espacoH) + 64
	must_be_position_y = cima + (int(((number-1)%15)/5))*(128 + espacoV) + 64
	
	real_position_x = 1500
	real_position_y = 296
	
	if(number <= 15):
		real_position_x = must_be_position_x
		real_position_y = must_be_position_y
	
	pass # Replace with function body.

func _process(delta):
	if(move == 0):
		return
	
	if(abs(real_position_x - self.rect_position.x) < 25 and abs(real_position_y - self.rect_position.y) < 25):
		move = 0
		self.rect_position.x = real_position_x
		self.rect_position.y = real_position_y
		return
		
	
	#print(abs(real_position_x - self.position.x))
	#print(abs(real_position_y - self.position.y))
	
	var hip = (real_position_x - self.rect_position.x)*(real_position_x - self.rect_position.x)
	hip+=(real_position_y - self.rect_position.y)*(real_position_y - self.rect_position.y)
	hip = sqrt(hip)
	
	self.rect_position.x += delta*vel*(real_position_x - self.rect_position.x)/hip
	self.rect_position.y += delta*vel*(real_position_y - self.rect_position.y)/hip
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
