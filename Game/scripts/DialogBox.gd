extends Control

var dialog = ["Hi, my name is Charge-Chan [Press Enter to continue]", "I touch my lick into a power plug and now i've become a charge", "Help me to become a human again!! Please senpai!! ", "First of all, click onto the charges to change their state", "After that, drag the second charge and slide it to the leftmost point", "I will be attracted right into the power plug!!", "Next levels will be harder and I won't be able to do nothing, so... Help me please!!!"]

var dialog_index = 0
var finished = false

func _ready():
	$Sprite/AnimationPlayer.play("IDLE")
	load_dialog()

func _process(delta):
	$Sprite.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property($RichTextLabel,"percent_visible",0,1,1, Tween.TRANS_LINEAR,Tween.EASE_IN_OUT)
		$Tween.start()
	else: 
		queue_free()
		print("Mudei o state")
		for fase in get_tree().get_nodes_in_group("fase"):
			fase.state = 1
	dialog_index+=1



func _on_Tween_tween_completed(object, key):
	finished = true		
