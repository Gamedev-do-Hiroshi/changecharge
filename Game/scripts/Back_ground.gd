extends Node2D

onready var X = preload("res://scenes/X.tscn")

var L = 10
var t = 0
var width = 128
var height = 128
var r = 0
var g = 0
var b = 0
var h = float(height)
var w = float(width)

func _ready():
	set_process(true)
	for i in 20:
		for j in 12:
			if i < 5 || i > 14:
				var s = X.instance()
				s.position = Vector2(16 + i*64, 16 + j*64)
				add_child(s)

func _process(delta):
	update()
	t+=delta

func _draw():
	for x in range(width):
		for y in range(height):
			
			r = .5*x/w*(sin(t)+PI/2)
			b = .5*(w-x)/w*(cos(t)+PI/2)
			
			
			draw_rect(Rect2(Vector2(x*L,y*L),Vector2(L,L)),Color(r,g,b))

