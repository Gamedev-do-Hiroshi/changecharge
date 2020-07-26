extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.

func desblock_fase(fase, lampadas):
	if(fase == 0):
		return
	var chapa = (fase-1)/15 + 1
	if(self.get_node("Chapa"+str(chapa)).get_node("ButtonFase"+str(fase)) == null):
		return
		
	#print(fase)
	
	self.get_node("Chapa"+str(chapa)).get_node("ButtonFase"+str(fase)).block=0
	
func desbolck_all():
	var data = loadSave()
	
	if(typeof(data) != TYPE_DICTIONARY):
		desblock_fase(1, 0)
		return
		
	var maior = 0
		
	for x in data.keys():
		desblock_fase(int(x), int(data[x][0]))
		if(int(x) > maior):
			maior = int(x)
	
	#print(maior)
	
	desblock_fase(maior + 1, 0)

func _ready():
	#reset()
	desbolck_all()
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

func save(fase, lampadas):
	var data = loadSave()
	if(typeof(data) != TYPE_DICTIONARY):
		data = {}
	
	var file = File.new()
	if file.open("user://saved_game.sav", File.WRITE) != 0:
		print("Error opening file")
		return
	
	data[fase]=[str(1), lampadas]
	
	file.store_line(to_json(data))
	file.close()

func loadSave():
	var tot = 0
	var file = File.new()
	#trocar para user://
	if file.open("user://saved_game.sav", File.READ) != 0:
		print("Error opening file")
		return
	
	var return_data=parse_json(file.get_as_text())

	file.close()
	print(return_data)
	
	return return_data

func reset():
	var file = File.new()
	if file.open("user://saved_game.sav", File.WRITE) != 0:
		print("Error opening file")
		return
	
	file.store_string("")
	file.close()


func _on_TextureButton_pressed():
	get_tree().change_scene("res://scenes/credits.tscn")
