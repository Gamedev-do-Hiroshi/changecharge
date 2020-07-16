extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Mais_pressed():
	if(get_node("Chapa3").lado == 2):
		return
	
	if(get_node("Chapa1").lado == 0):
		get_node("Chapa1").change = 1
	if(get_node("Chapa2").lado == 0):
		get_node("Chapa2").change = 1
	if(get_node("Chapa3").lado == 0):
		get_node("Chapa3").change = 1
		
	get_node("Chapa1").lado+=1	
	get_node("Chapa2").lado+=1	
	get_node("Chapa3").lado+=1	
		
	if(get_node("Chapa1").lado == 0):
		get_node("Chapa1").change = 1
	if(get_node("Chapa2").lado == 0):
		get_node("Chapa2").change = 1
	if(get_node("Chapa3").lado == 0):
		get_node("Chapa3").change = 1	
	pass # Replace with function body.


func _on_Menos_pressed():
	if(get_node("Chapa1").lado == -2):
		return
	
	if(get_node("Chapa1").lado == 0):
		get_node("Chapa1").change = 1
	if(get_node("Chapa2").lado == 0):
		get_node("Chapa2").change = 1
	if(get_node("Chapa3").lado == 0):
		get_node("Chapa3").change = 1
		
	get_node("Chapa1").lado-=1	
	get_node("Chapa2").lado-=1	
	get_node("Chapa3").lado-=1	
		
	if(get_node("Chapa1").lado == 0):
		get_node("Chapa1").change = 1
	if(get_node("Chapa2").lado == 0):
		get_node("Chapa2").change = 1
	if(get_node("Chapa3").lado == 0):
		get_node("Chapa3").change = 1	
	
	pass # Replace with function body.



func _on_home_pressed():
	get_tree().change_scene("res://scenes/Title_Screen.tscn")
	pass # Replace with function body.
