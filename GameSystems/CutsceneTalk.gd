extends Node2D
signal textBox_Closed

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	Fade.FadeOut()
	Diologe.display_text("???","Cayotees and foxes have been raveging our villages farm animals for a while")
	yield (self, "textBox_Closed")
	
	print("rew")
	Diologe.display_text("???","We never had an issue with them up until now")
	yield (self, "textBox_Closed")
	Diologe.display_text("???","What ever cuased these beasts to be more savage than usual is beyand me")
	yield (self, "textBox_Closed")
	
	Diologe.display_text("???","Hey thare's a kid on top of the mountain")
	yield (self, "textBox_Closed")
	Diologe.display_text("???","I can't seam to pick him up")
	yield (self, "textBox_Closed")
	Diologe.display_text("???","well I should go back and ask for help")
	yield (self, "textBox_Closed")
	Diologe.display_text("???","Here I'll leave the radio here so I know where to go")
	yield (self, "textBox_Closed")
	get_tree().change_scene("res://Rooms/MountainArea.tscn")
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Z_input") and Diologe.canseeTalk == true:
		emit_signal("textBox_Closed")
	pass
