extends Node

onready var X = preload("res://scenes/X.tscn")

func _ready():
	
	
	for i in 20:
		for j in 12:
			if i < 5 || i > 14:
				var s = X.instance()
				s.position = Vector2(16 + i*64, 16 + j*64)
				add_child(s)
