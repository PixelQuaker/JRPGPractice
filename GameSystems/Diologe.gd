extends Node2D
signal textBox_Closed
#Does not work2
var typing_speed = .1
var read_time = 2
var canseeTalk

#var current_message = 0
#var display = ""
#var current_char = 0
# Declare var TalkingtoSelfmember variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	#if Input.is_action_just_pressed("Z_input") and Diologe.canseeTalk == true:
		#emit_signal("textBox_Closed")
	Fade.FadeOut()
	$CanvasLayer/Sprite.hide()
	$CanvasLayer/TextBox.hide()
	$CanvasLayer/ColorRect2.hide()
	$CanvasLayer/ColorRect4.hide()
	$CanvasLayer/ColorRect3.hide()
	$CanvasLayer/Name.hide()
	$CanvasLayer/PushZ.hide()

	pass # Replace with function body.
func _process(delta):
	canseeTalk = $CanvasLayer/Sprite.visible 
	#IF Mobile = true
	if (Input.is_action_just_pressed("Z_input")) and canseeTalk == true:
		$CanvasLayer/Sprite.hide()
		$CanvasLayer/TextBox.hide()
		$CanvasLayer/ColorRect2.hide()
		$CanvasLayer/ColorRect4.hide()
		$CanvasLayer/ColorRect3.hide()
		$CanvasLayer/Name.hide()
		$CanvasLayer/PushZ.hide()
		emit_signal("textBox_Closed")
		#Test the dialoge with this
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass
func DiologeHide():
	$CanvasLayer/Sprite.hide()
	$CanvasLayer/TextBox.hide()
	$CanvasLayer/ColorRect2.hide()
	$CanvasLayer/ColorRect4.hide()
	$CanvasLayer/ColorRect3.hide()
	$CanvasLayer/Name.hide()
	$CanvasLayer/PushZ.hide()
	pass
func DiologeShow():
	$CanvasLayer/Sprite.show()
	$CanvasLayer/TextBox.show()
	$CanvasLayer/ColorRect2.show()
	$CanvasLayer/ColorRect4.show()
	$CanvasLayer/ColorRect3.show()
	$CanvasLayer/Name.show()
	$CanvasLayer/PushZ.show()
	pass
func display_text(Name, text):
	$CanvasLayer/Sprite.show()
	$CanvasLayer/TextBox.show()
	$CanvasLayer/ColorRect2.show()
	$CanvasLayer/ColorRect4.show()
	$CanvasLayer/ColorRect3.show()
	$CanvasLayer/Name.show()
	$CanvasLayer/PushZ.show()
	$CanvasLayer/TextBox.text = text
	$CanvasLayer/Name.text = Name
	#$next_char.set_wait_time(typing_speed)
	#$next_char.start()
	#Put time in a timer to put each letters out persecond not working. fix later
	#You knoww what this is not worth my time. if those fucking cunts are going to complain about the dialoge speed fuck them
	#bro you having a fucking melt down to yourself fucking cringe
	#SHUT UP
	# To do: Hire someone else to to the code for this shit dialoge them smartass
	#if (current_char < len(text[current_message])):
	#	var next_char = text[current_message][current_char]
	#	display += next_char
	#	
	#	$CanvasLayer/TextBox.text = display
	#	current_char += 1
	#else:
	#	$next_char.stop()
	#	$next_message.one_shot = true
	#	$next_message.set_wait_time(read_time)
	#	$next_message.start()
	pass
