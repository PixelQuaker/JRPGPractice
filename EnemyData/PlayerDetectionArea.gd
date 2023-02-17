extends Area2D

var player = null

func canseePlayer():
	return player != null


func _on_PlayerDetectionArea_body_entered(body):
	if body.is_in_group("Player"):
		player = body
	#else:
		#player = null
	pass # Replace with function body.


func _on_PlayerDetectionArea_body_exited(body):
	player = null
	pass # Replace with function body.


func _on_PlayerDetectionArea_area_entered(area):
	if area.is_in_group("Player"):
		player = area
	pass # Replace with function body.
