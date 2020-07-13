extends KinematicBody2D

export var number = 1;
const cima = 170
const baixo = 100
const lado = 200
const espacoV = (720 - cima - baixo - 3*128)/2
const espacoH = (1280 - lado - lado - 5*128)/4
const vel = 500
var real_position_x
var real_position_y
var must_be_position_x
var must_be_position_y
var move = 1;

# Called when the node enters the scene tree for the first time.
func _ready():
	$Button.text = str(number)
	self.position.x = 1500
	self.position.y = 360
	
	must_be_position_x = lado + ((number-1)%5)*(128 + espacoH) + 64
	must_be_position_y = cima + (int(((number-1)%15)/5))*(128 + espacoV) + 64
	
	real_position_x = 1500
	real_position_y = 360
	
	if(number <= 15):
		real_position_x = must_be_position_x
		real_position_y = must_be_position_y
	
	pass # Replace with function body.

func _physics_process(delta):
	if(move == 0):
		return
	
	if(abs(real_position_x - self.position.x) < 10 and abs(real_position_y - self.position.y) < 10):
		move = 0
		self.position.x = real_position_x
		self.position.y = real_position_y
		return
		
	
	#print(abs(real_position_x - self.position.x))
	#print(abs(real_position_y - self.position.y))
	
	var hip = (real_position_x - self.position.x)*(real_position_x - self.position.x)
	hip+=(real_position_y - self.position.y)*(real_position_y - self.position.y)
	hip = sqrt(hip)
	
	self.position.x += delta*vel*(real_position_x - self.position.x)/hip
	self.position.y += delta*vel*(real_position_y - self.position.y)/hip
	
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
