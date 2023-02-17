extends Node2D


func _ready():
	$LevelStorage.visible = false
	pass # Replace with function body.



func _on_Health_pressed():
	Global.TotalHP += Global.HpPerLevelUP
	Global.Health += Global.HpPerLevelUP
	$LevelStorage.visible = false
	
	pass # Replace with function body.


func _on_PSI_pressed():
	Global.TotalPP += Global.PPPerLevelUP
	Global.PP += Global.PPPerLevelUP
	$LevelStorage.visible = false
	pass # Replace with function body.



func _on_Offence_pressed():
	Global.Off += Global.OffPerLevelUP
	$LevelStorage.visible = false
	pass # Replace with function body.


func _on_Defend_pressed():
	Global.Def += Global.DefPerLevelUP
	$LevelStorage.visible = false
	pass # Replace with function body.
