extends KinematicBody2D


export(int) var speed = 50
func _ready():
	if Global.InVisTime == true:
		
		$AnimationPlayer2.play("InvisTime")
		yield($AnimationPlayer2, "animation_finished")
		Global.InVisTime = false
	pass
func _physics_process(delta):
	
	#if Input.is_action_just_pressed("ui_z"):
		#for body in $Area2D.get_overlapping_bodies():
		#	if body.is_in_group("NPC"):
			#	body.interaction()
	if Global.InCutscene == false:
		if Input.is_action_pressed("Run"):
			speed = 100
		elif Input.is_action_just_released("Run"):
			speed = 50
		var input_vector = Vector2.ZERO
			#if Global.cutsceneActive == false:
		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
			
		if input_vector == Vector2.ZERO:
			$AnimationTree.get("parameters/playback").travel("Idle")
		else:
			$AnimationTree.get("parameters/playback").travel("Walk")
			move_and_slide(input_vector * speed)
			$AnimationTree.set("parameters/Idle/blend_position", input_vector)
			$AnimationTree.set("parameters/Walk/blend_position", input_vector)
	elif Global.InCutscene == true:
		var input_vector = Vector2.ZERO

		input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		input_vector = input_vector.normalized()
			
		if input_vector == Vector2.ZERO:
			$AnimationTree.get("parameters/playback").travel("Idle")
		else:
			$AnimationTree.set("parameters/Idle/blend_position", input_vector)
