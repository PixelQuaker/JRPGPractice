extends Area2D


func _on_Area2D_body_entered(area):
	if area.is_in_group("Player"):
		Fade.FadeIn()
		yield(get_tree().create_timer(.6), "timeout")
		EnemyData.AntSpawn = true
		Global.from_level = get_parent().name
		get_tree().change_scene("res://Rooms/" + self.name + ".tscn")
		
