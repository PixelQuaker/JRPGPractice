extends Node2D

var current_enemy_health = 0

func _ready():
	set_health($HP, EnemyData.AntHealth, EnemyData.MAXAntHealth)
	current_enemy_health = EnemyData.AntHealth
	
func set_health(progress_bar, health, max_health):
	progress_bar.value = health
	progress_bar.max_value = max_health
	progress_bar.get_node("HpLabel").text = "HP: %d/%d" % [health, max_health]

