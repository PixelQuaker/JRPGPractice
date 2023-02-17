extends Node

var ShopCanInteract: bool = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal textBox_Closed
signal ElftextBox_Closed
var CyoteTalk = false
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#if Input.is_action_just_pressed("Z_input") and Diologe.canseeTalk == true:
	#	emit_signal("textBox_Closed")
	#if Input.is_action_just_pressed("Z_input") and Diologe.TalkingtoSelf== true:
	#	emit_signal("ElftextBox_Closed")
	pass
