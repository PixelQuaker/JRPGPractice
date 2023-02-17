extends Area2D

func _ready():
	$AnimatedSprite.visible = false
	pass
func _on_Area2D_body_entered(area):
	if area.is_in_group("Player"):
		$AnimatedSprite.visible = true
		Fade.FadeIn()
		yield(get_tree().create_timer(.6), "timeout")
		Global.from_level = get_parent().name
		get_tree().change_scene("res://Rooms/" + self.name + ".tscn")


func _on_Area2D_body_exited(body):
	$AnimatedSprite.visible = false
	pass # Replace with function body.
