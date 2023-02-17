extends KinematicBody2D

export var speed = 200.0
#onready var player = get_parent().get_node("Player")
export var MaxSpeed = 200
export var Acceleration = 300
export var Friction = 200
onready var Playerdetection = $PlayerDetectionArea
var enemy_position = Vector2(rand_range(1000, -200), rand_range(0, 1000))
enum {
	Idle,
	Wander,
	Chase,
	StandStill
	
}
var velocity = Vector2.ZERO
var state = Idle
func _ready():
	print(enemy_position)
	self.position = enemy_position
	if EnemyData.AntSpawn == false:
		self.queue_free()
	
	pass 


func _process(delta):
	if Global.InVisTime == true:
		state = Wander
		yield(get_tree().create_timer(3), "timeout")
		state = Idle
	match state:
		Idle:
			velocity = velocity.move_toward(Vector2.ZERO, Friction*delta)
			seek_player()
			velocity = move_and_slide(velocity)
			pass
		Wander:
			pass
		StandStill:
			velocity = 0
			pass
		Chase:
			if Global.InCutscene == false:
				var player = Playerdetection.player
				if player != null:
					
					var deriction = (player.global_position - global_position).normalized()
					velocity = velocity.move_toward(deriction*MaxSpeed,Acceleration  * delta)
					velocity = move_and_slide(velocity)
				else:
					state = Idle
				pass
			elif Global.InCutscene == true:
				state = StandStill
	
	
	pass
	
func seek_player():
	if Playerdetection.canseePlayer() == true:
		state = Chase


func _on_ColisionDetectionPlayer_body_entered(body):
	if body.is_in_group("Player"):
		Global.InCutscene = true
		Fade.BattleFadeIn()
		yield(get_tree().create_timer(2), "timeout")
		Global.InBattle = true
		Global.EnemyType = 0
		self.queue_free()
		
	pass # Replace with function body.
