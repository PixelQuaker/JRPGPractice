extends Node2D

const Battle = preload("res://BattleRoom/Battle.tscn")
signal textBox_Closed
signal ElftextBox_Closed
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var system_started = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Fade.FadeOut()
	Global.InBattle = false
	get_node("BattlePos").position.x = Global.battlePositionx
	get_node("BattlePos").position.y = Global.battlePositiony 
	Global.Overworld = self.name
	Global.CurrentRoom = self.name
	if Global.from_level != null:
		get_node("YSort/Player").set_position(get_node(Global.from_level + "Pos").position)
	else:
		get_node("YSort/Player").set_position(get_node("Pos").position)
		
		
	pass # Replace with function body.
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_just_pressed("Z_input") and Diologe.canseeTalk == true:
	#	emit_signal("textBox_Closed")
	#if Input.is_action_just_pressed("Z_input") and Diologe.TalkingtoSelf== true:
	#	emit_signal("ElftextBox_Closed")
		
	#if Global.KitchenIsOpened == true:
		#$KitchenKeyCheck.position = $OutOfSite.position
		#$KitchenKey.position = $OutOfSite.position
	if Global.InBattle == true:
			Global.battlePositionx = get_node("YSort/Player").position.x
			Global.battlePositiony = get_node("YSort/Player").position.y
			get_parent().add_child(Battle.instance())
			queue_free()
	
	
	pass
func RandomEnemyChance():
	system_started = false
	yield(get_tree().create_timer(.5),"timeout")
	Global.GetNewNumberForEnemyChance(0,100)
	if Global.EnemyChancce == 0:
		Global.EnemyType = 0
		Global.InBattle = true
	system_started = true
	set_process(true)
