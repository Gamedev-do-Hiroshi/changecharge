extends Control

var dialog = ["Hi, my name is Hiroshi", "Your mission, and mine, is to make me arrive to the power plug"]

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
	dialog_index+=1



func _on_Tween_tween_completed(object, key):
	finished = true
