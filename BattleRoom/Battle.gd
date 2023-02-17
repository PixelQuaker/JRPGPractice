extends Node2D
signal minigameCLosed
onready var Stats_HP = $Hp
onready var States_JP = $PP
signal textBox_Closed
var defending = false
#onready var Invetory = get_node("Item")
var callAttackOnce = false
var AttackPow = 0
var callTheProcessForAttack = false
var AttackPowMax = Global.AttackCounterMAX
var LeftPush = 0
var RightPush = 0
var PSIBeamMinigame = false
var PSIBeamMinigameC0omplete = false
onready var AttackLabel = $AttackLabels
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.EnemyType = 0
	Music.Battle()
	$YOUWON.visible = false
	Fade.BattleFadeOut()
	$Skill.visible = false
	$EnemyAntBattle.visible = true
	if Global.EnemyType == 0:	
		$EnemyAntBattle.position = $EnemyPos.position
		$EnemyAntBattle.visible = true
		$EnemyCayoteBattle.visible = false
		$EnemyCayoteBattle.visible = false
	display_text("You are under attack"  )
	yield (self, "textBox_Closed")
	$Statscontainer.visible = true
	$Skill.visible = false
	pass # Replace with function body.

func display_text(text):
	#$TextBox.hide()
	$AgainstA.show()
	$AgainstA.text = text
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if callTheProcessForAttack == true:
		if AttackPow < AttackPowMax:
			if Input.is_action_just_pressed("ui_left"):
				AttackLabel.text += "Left"
				AttackPow += 1
				LeftPush += 1
			if Input.is_action_just_pressed("ui_right"):
				AttackLabel.text += "Right"
				AttackPow += 1
				RightPush += 1
		if AttackPow >= AttackPowMax:
			callAttackOnce = true
			callTheProcessForAttack = false
	if callAttackOnce == true:
		callAttackOnce = false
		AttackEm()
		
	if PSIBeamMinigame == true:
		if Input.is_action_just_pressed("Z_input"):
				$BattleHandz/TimeLimit2.value += 20
				if $BattleHandz/TimeLimit2.value >= 100:
					PSIBeamMinigameC0omplete = true
					emit_signal("minigameCLosed")
				else:
					PSIBeamMinigameC0omplete = false
					
					
	Stats_HP.text = "HP: " +str(Global.Health) + "/" +str(Global.TotalHP)
	States_JP.text = "PP: " +str(Global.PP) + "/" + str(Global.TotalPP)
	if (Input.is_action_just_pressed("Z_input")) and $AgainstA.visible == true:
		$AgainstA.hide()
		emit_signal("textBox_Closed")
	pass
func AttackEm():
	display_text("You through a punch" )
	yield (self, "textBox_Closed")
	for i in range(LeftPush):
		$BattleHandz/AnimationPlayer.play("AttackLeft")
		yield($BattleHandz/AnimationPlayer, "animation_finished")
		EnemyData.AntHealth = max(0, EnemyData.AntHealth - Global.Off)
		$EnemyAntBattle.set_health($EnemyAntBattle/HP, EnemyData.AntHealth, EnemyData.MAXAntHealth)	
		$AnimationPlayer.play("AntFade")
		$BattleHandz/AnimationPlayer.play("Idle")
		yield($BattleHandz/AnimationPlayer, "animation_finished")
		
	for i in range(RightPush):
		$BattleHandz/AnimationPlayer.play("AttackRight")
		yield($BattleHandz/AnimationPlayer, "animation_finished")
		EnemyData.AntHealth = max(0, EnemyData.AntHealth - Global.Off)
		$EnemyAntBattle.set_health($EnemyAntBattle/HP, EnemyData.AntHealth, EnemyData.MAXAntHealth)	
		$AnimationPlayer.play("AntFade")
		$BattleHandz/AnimationPlayer.play("Idle")
		yield($BattleHandz/AnimationPlayer, "animation_finished")
	$BattleHandz/AnimationPlayer.play("Idle")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	EnemyTurn()
	pass

func _on_Attack_pressed():
	if Global.AtackModeChangedToPunch == true:
		$Statscontainer.visible = false
		display_text("You began to Attack" )
		yield (self, "textBox_Closed")
		callTheProcessForAttack = true
	elif Global.AtackModeChangedToPunch == false:
		$Statscontainer.visible = false
		display_text("You began to Attack" )
		yield (self, "textBox_Closed")
		$BattleHandz/AnimationPlayer.play("AttackRight")
		yield($BattleHandz/AnimationPlayer, "animation_finished")
		#if Global.EnemyType == 0:
		Global.GetNewNumber(0, 20)
		if Global.RNG >1:
			
			if Global.EnemyType == 0:
				EnemyData.AntHealth = max(0, EnemyData.AntHealth - Global.Off)
				$EnemyAntBattle.set_health($EnemyAntBattle/HP, EnemyData.AntHealth, EnemyData.MAXAntHealth)	
				$AnimationPlayer.play("AntFade")
				display_text("HIT")
				$BattleHandz/AnimationPlayer.play("Idle")
				yield (self, "textBox_Closed")
			EnemyTurn()
		elif Global.RNG == 0:
			Global.GetNewNumber(0, 4)
			if Global.RNG == 0:
				display_text("You Missed")
				yield (self, "textBox_Closed")
			elif Global.RNG == 1:
				display_text("The enemy doged Quickly")
				yield (self, "textBox_Closed")
			elif Global.RNG == 2:
				display_text("You failed to attack")
				yield (self, "textBox_Closed")
			elif Global.RNG == 3:
				display_text("You sliped up")
				yield (self, "textBox_Closed")
			elif Global.RNG == 4:
				display_text("missed by an inch")
				yield (self, "textBox_Closed")
			EnemyTurn()
	pass # Replace with function body.
func _on_PSI_pressed():
	$Skill.visible = true
	$Statscontainer.visible = false
	
	pass # Replace with function body.
func _on_Item_pressed():
	$Statscontainer.visible = false
	$Statscontainer.visible = false
	
	Global.cansee = true
		#get signal when item is taken
	display_text("You began to take an item")
	yield (self, "textBox_Closed")
	Global.cansee = false
	EnemyTurn()
	pass # Replace with function body.
func _on_Defend_pressed():
	$BattleHandz/AnimationPlayer.play("GuardOn")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	defending = true
	$Statscontainer.visible = false
	EnemyTurn()
	pass # Replace with function body.
func _on_Run_pressed():
	Global.GetNewNumber(0, 20)
	$Statscontainer.visible = false
	display_text("You tried to run away")
	yield (self, "textBox_Closed")
	if Global.RNG > 1:
		Global.InBattle = false
		Global.from_level = self.name
		display_text("You Ran away succsesfully")
		yield (self, "textBox_Closed")
		Music.BattleOver()
		get_tree().change_scene("res://Rooms/" + Global.Overworld + ".tscn")
		queue_free()
	elif Global.RNG == 0:
		display_text("You failed to run away")
		yield (self, "textBox_Closed")
		$Statscontainer.visible = true
		EnemyTurn()
	pass # Replace with function body.
func EnemyTurn():
	if Global.EnemyType == 0:
		if EnemyData.AntHealth<= 0:
			$AnimationPlayer.play("AntDead")
			yield($AnimationPlayer, "animation_finished")
			display_text("You managed to squish the Ant")
			yield (self, "textBox_Closed")
			$Statscontainer.visible = false
			BattleEnded()
		if EnemyData.AntHealth > 0:
			display_text("The Ant began to attack")
			yield (self, "textBox_Closed")
			if defending == false:	
				Global.GetNewNumber(0, 20)
				if Global.RNG >= 1:
					#$Audio.play()
					Stats_HP.text = "HP: " + str(max(0, Global.Health - max(0,EnemyData.AntAttack- Global.Def)))
					Global.Health -= EnemyData.AntAttack
								
					$Statscontainer.visible = true	
				elif Global.RNG == 0:
					Global.GetNewNumber(0, 2)
					if Global.RNG ==0:
						display_text("You Doged Quickly")
						yield (self, "textBox_Closed")
					elif Global.RNG ==1:
						display_text("You fell and the enemy missed")
						yield (self, "textBox_Closed")
					elif Global.RNG ==2:
						display_text("You fell and the enemy missed")
						yield (self, "textBox_Closed")
					defending = false
					$Statscontainer.visible = true
			elif defending == true:
				Global.GetNewNumber(0, 20)
				if Global.RNG >= 10:
					display_text("The Ant went around your defence")
					yield (self, "textBox_Closed")
					#$Audio.play()
					Stats_HP.text = "HP: " + str(max(0, Global.Health - max(0,EnemyData.AntAttack- Global.Def)))
					Global.Health -= max(0,EnemyData.AntAttack - Global.Def)
					$BattleHandz/AnimationPlayer.play("GuardOff")
					yield($BattleHandz/AnimationPlayer, "animation_finished")
					defending = false
					$Statscontainer.visible = true
				elif Global.RNG < 10:			
					Global.GetNewNumber(0, 2)
					if Global.RNG ==0:
						display_text("You Doged Quickly")
						yield (self, "textBox_Closed")
					elif Global.RNG ==1:
						display_text("You Dropped and the enemy missed")
						yield (self, "textBox_Closed")
					elif Global.RNG ==2:
						display_text("You Baited the enemy and it missed")
						yield (self, "textBox_Closed")
					$BattleHandz/AnimationPlayer.play("GuardOff")
					yield($BattleHandz/AnimationPlayer, "animation_finished")
					$Statscontainer.visible = true
					defending = false
func PSIBeamMinigame():
	PSIBeamMinigame = true
	$BattleHandz/AnimationPlayer.play("PSIBeam")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	$BattleHandz/AnimationPlayer.play("PSIBeamCharge")
	yield(get_tree().create_timer(2),"timeout")
	emit_signal("minigameCLosed")
	
	pass
func _on_PKBeam_pressed():
	$Skill.visible = false
	display_text("You began to use PSI Beam on the enemy")
	yield (self, "textBox_Closed")
	#$BattleHandz/AnimationPlayer.play("")
	PSIBeamMinigame()
	yield (self, "minigameCLosed")
	PSIBeamMinigame = false
	$BattleHandz/AnimationPlayer.play("PSIBeamToss")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	$BattleHandz/TimeLimit2.value = 0
	if Global.EnemyType == 0:
		if PSIBeamMinigameC0omplete == false:
			$AnimationPlayer.play("AntFade")
			yield($AnimationPlayer, "animation_finished")
			Global.PP -= Global.PKBeamCoast
			EnemyData.AntHealth = max(0, EnemyData.AntHealth - (Global.PKBeam - (Global.PKBeam/2)))
			$EnemyAntBattle.set_health($EnemyAntBattle/HP, EnemyData.AntHealth, EnemyData.MAXAntHealth)
		elif PSIBeamMinigameC0omplete == true:
			$AnimationPlayer.play("AntFade")
			yield($AnimationPlayer, "animation_finished")
			Global.PP -= Global.PKBeamCoast
			EnemyData.AntHealth = max(0, EnemyData.AntHealth - Global.PKBeam)
			$EnemyAntBattle.set_health($EnemyAntBattle/HP, EnemyData.AntHealth, EnemyData.MAXAntHealth)
	$BattleHandz/AnimationPlayer.play("Idle")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	EnemyTurn()
	pass # Replace with function body.
func _on_PKHeal_pressed():
	$Skill.visible = false
	display_text("You began to use PSI Heal on Yourself")
	yield (self, "textBox_Closed")
	Stats_HP.text = "HP: " + str(max(Global.TotalHP, Global.Health +  Global.PKHeal))
	Global.PP -= Global.PKHealCoast
	if Global.Health + 52 <= Global.TotalHP:
		Global.Health += 52
	elif Global.Health + 52 >= Global.TotalHP:
		Global.Health = Global.TotalHP
	EnemyTurn()
	pass # Replace with function body.
func _on_Back_pressed():
	$Skill.visible = false
	$Statscontainer.visible = true
	pass # Replace with function body.
func BattleEnded():
	$Statscontainer.visible = false
	Global.BattleEnded= true
	print(str(Global.EXPerLevelUp))
	#$Music.playing = false
	#$Music.autoplay = false
	#$EnemyDown.playing = true
	defending = false
	$YOUWON.visible = true
	$AnimationPlayer.play("YouWin")
	yield($AnimationPlayer, "animation_finished")
	Global.InVisTime = true
	if Global.EnemyType == 0:
		Global.XP += EnemyData.AntEXP
		display_text("You gained " + str(EnemyData.AntEXP) + " EXP")
		yield (self, "textBox_Closed")
		EnemyData.AntHealth = EnemyData.MAXAntHealth
		EnemyData.AntSpawn = false
	if Global.XP >= Global.EXPerLevelUp:
		$LevelUp/AudioStreamPlayer.playing = true
		$LevelUp/AudioStreamPlayer.autoplay = true
		display_text("You Leveled Up!!")
		yield (self, "textBox_Closed")
		#IncreasesHP
		Global.GetNewNumber(1, 10)
		Global.TotalHP += Global.RNG
		Global.Health += Global.RNG
		display_text("+" + str(Global.RNG) + " Hp")
		yield (self, "textBox_Closed")
		#IncreasePp
		Global.GetNewNumber(1, 10)
		Global.TotalPP += Global.RNG
		Global.PP += Global.RNG
		display_text("+" + str(Global.RNG) + " Pp")
		yield (self, "textBox_Closed")
		#IncreasesDef
		Global.GetNewNumber(1, 10)
		Global.Def += Global.RNG
		display_text("+" + str(Global.RNG) + " Def")
		yield (self, "textBox_Closed")
		#IncreasesOff
		Global.GetNewNumber(1, 10)
		Global.Def += Global.RNG
		display_text("+" + str(Global.RNG) + " Def")
		yield (self, "textBox_Closed")
		display_text("Choose which Stat you want extra points for")
		$LevelUp/LevelStorage.visible = true
		yield (self, "textBox_Closed")
		$LevelUp/LevelStorage.visible = false
		Global.EXPerLevelUp += (Global.EXPerLevelUp/1.5)
		print(str(Global.EXPerLevelUp))
		Global.InBattle = false
		Global.from_level = self.name
		Music.BattleOver()	
		get_tree().change_scene("res://Rooms/" + Global.Overworld + ".tscn")
		queue_free()
	elif Global.XP < Global.EXPerLevelUp:
		Global.InBattle = false
		Global.from_level = self.name
		Music.BattleOver()	
		get_tree().change_scene("res://Rooms/" + Global.Overworld + ".tscn")
		queue_free()
func _on_PKPrey_pressed():
	$Statscontainer.visible = false
	$Skill.visible = false
	$BattleHandz/AnimationPlayer.play("PSIPreyPrep")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	$BattleHandz/AnimationPlayer.play("PSIPray")
	$BattleHandz/AnimationPlayer.play("Idle")
	yield($BattleHandz/AnimationPlayer, "animation_finished")
	EnemyTurn()
	pass # Replace with function body.
