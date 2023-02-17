extends Node2D

func _ready():
	$CanvasLayer/Sprite.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func FadeIn():
	$CanvasLayer/AnimationPlayer.play("FadeIn")
	Global.InCutscene= true
	yield($CanvasLayer/AnimationPlayer, "animation_finished")
	Global.InCutscene= false
	pass

func BattleFadeIn():
	$CanvasLayer/AnimationPlayer.play("BattleFadeIn")
	Global.InCutscene= true
	yield($CanvasLayer/AnimationPlayer, "animation_finished")
	Global.InCutscene= false
	pass
	
func FadeOut():
	$CanvasLayer/AnimationPlayer.play("FadeOut")
	yield($CanvasLayer/AnimationPlayer, "animation_finished")
	pass
	

func BattleFadeOut():
	$CanvasLayer/AnimationPlayer.play("BattleFadeOut")
	yield($CanvasLayer/AnimationPlayer, "animation_finished")
	pass
