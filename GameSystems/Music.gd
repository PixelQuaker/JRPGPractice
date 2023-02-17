extends Node2D

onready var tween_out = get_node("Tween")

export var transition_duration = 2.00
export var transition_type = 1 # TRANS_SINE
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
func fade_out(stream_player):
	# tween music volume down to 0
	tween_out.interpolate_property(stream_player, "volume_db", -100, -5, transition_duration, transition_type, Tween.EASE_IN,0 )
	tween_out.start()
	# when the tween ends, the music will be stopped
	
func fade_In(stream_player):
	# tween music volume down to 0
	tween_out.interpolate_property(stream_player, "volume_db", -5, -100, transition_duration, transition_type, Tween.EASE_IN,0 )
	tween_out.start()
	# when the tween ends, the music will be stopped
	
func _on_Tween_tween_completed(object, key):
	#object.stop()
	pass # Replace with function body.
	# stop the music -- otherwise it continues to run at silent volume

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.

func Mountain():
	pass
	
	
func OiasisOfHope():
	pass
	
	
func Town():
	
	pass
	
	
func Shop():
	
	pass

func Battle():
	$BattleBeatDown.playing = true
	$BattleBeatDown.autoplay = true
	pass
func BattleOver():
	$BattleBeatDown.playing = false
	$BattleBeatDown.autoplay = false
	pass

func Doungen():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
