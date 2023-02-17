extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var KritzTime = 0
var RNG = 0
var EnemyChancce = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


var InVisTime: bool = false
var InCutscene: bool = false
var MobileControlls: bool = false
var Time: int = 700
var canSwitch

var battlePositionx = 0
var battlePositiony = 0
var CurrentRoom = ""
var IsRaining: bool = false
var automoveDirection = Vector2.ZERO
var DummyTalk: bool = false
var Statues: bool = false
var RainingSoundIsPlaying: bool = false
#StoryEventWold
var NirbInteraction: bool = false
var NirbTalked: bool = false

var PlayerOutOfBound = false

var InBattle: bool = false
var BattleEnded: bool = false
var PlayerTurn: int = 0

var FridgeInteractopn1: bool = true


var XP: int = 0

var cutsceneActive: bool = false

var EXPerLevelUp: int = 25

var LevelUp: bool = false

var PPPerLevelUP: int = 2
var HpPerLevelUP: int = 5
var DefPerLevelUP: int = 2
var OffPerLevelUP: int = 2

var TotalHP: int = 12
var Health: int = TotalHP
var KeyGet: bool = false

var TotalPP: int = 15


var PP: int = TotalPP
var Def: int = 1
var CurrentLV: int = 3
var Off: int = 4

var AtackModeChangedToPunch = true

var PKBeam: int = 4
var PKBeamCoast: int = 10
var PKHeal: int = 50
var PKHealCoast: int = 5

var SPeed: int = 5
var tutorialbattleComplete = false
var tutorialbattle = true

var ItemsInINvetory: int = 0
var ItemsInINvetoryTotal: int = 14

var cansee: bool = false


var MarranitosHave: int = 0
var MarranitosTotal: int = 10

#Jello Brings EP up
var TortaHave: int = 0
var TortaTotal: int = 10


#Slushy Brings EP up
var ConchaHave: int = 0
var ConchaTotal: int = 10
#Buorboror
var FlanHave: int = 0
var FlanTotal: int = 10
#fries
var quesadillaHave: int = 0
var quesadillaTotal: int = 10

var BizcochoHave: int = 0
var BizcochoTotal: int = 10


var GalletaHave: int = 0
var GalletaTotal: int = 10

var PolvoronHave: int = 0
var PolvoronTotal: int = 10

var CafeHave: int = 0
var CafeTotal: int = 10

var ChicharronHave: int = 0
var ChicharronTotal: int = 10

var RompopeHave: int = 0
var RompopeTotal: int = 10

#What would Speed Do?
var from_level = ""
var Overworld = ""


var EnemyType: int = 0



#0 = Ant
#1 = fennec
#2 = cayote 
#3 = turtose
#4 = boss
#5 = 
var AttackCounterMAX = 3

var StatusEffects = "Normal"
var AttackUpION = false
var AttackUpI = 3
var AttackUpITurn = 3
var AttackUpEnergy = 20

#Bleed
var bleedION = false
var bleedI = 3
var bleedITurn = 3
#GrossOut
var grossOutION = false
var grossOutI = 4
var grossOutITurn = 4
var grossOutIION = false
var grossOutII = 8
var grossOutIITurn = 4
#Dizzy
var DizzyION = false
var DizzyITurn = 2
#Sleepy
var SleepION = false
var SleepITurn = 3
#Disoreanted
var DisoreantedION = false
var DisoreantedITurn = 5
#OnFire
var burnninION = false
var burnninI: int = 1
var burnninITurn: int = 3
#Zapped
var ZappedION = false
var ZappedI: int = 1
var ZappedITurn: int = 3
#Freezed
var FreezedION = false
var FreezedITurn: int = 3
#NumbOnPainKillers
var PainKillerION = false
var PainKillerITurn: int = 4

var PainKillerIION = false
var PainKillerIITurn: int = 6

var dataUseSave1 = false
var dataUseSave2 = false
var dataUseSave3 = false


var data1
var data2
var data3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func GetNewNumber(Smallest, Largest):
	RNG = range(Smallest,Largest)[randi()%range(Smallest,Largest).size()]
	print(RNG)

func GetNewNumberForEnemyChance(Smallest, Largest):
	EnemyChancce = range(Smallest,Largest)[randi()%range(Smallest,Largest).size()]
	print(RNG)

	# change this to totaldamage * randomchance
func GetRandomCritChance(CritRange, Largest):
	RNG = range(CritRange,Largest)[randi()%range(CritRange,Largest).size()]
	print(KritzTime)
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func save_game():
	#When picking save 1
	if dataUseSave1 == true:
		data1 = {
		}
		
		var file = File.new()
		file .open("user://savegame1.json", File.WRITE)
		var json = to_json(data1)
		file.store_line(json)
		
		file.close()
	elif dataUseSave2 == true:
		data2 = {
		}
		
		var file = File.new()
		file .open("user://savegame2.json", File.WRITE)
		var json = to_json(data2)
		file.store_line(json)
		
		file.close()
func load_game():
	if dataUseSave1 == true:
		var file = File.new()
		file.open("user://savegame1.json", File.READ)
		data1 = parse_json(file.get_as_text())
		file.close()
		
		automoveDirection = Vector2(data1.automoveDirection[0], data1.automoveDirection[1])
		#DealLater
		#WorldEvents
		
		#G
		
		get_tree().change_scene("res://Rooms/" + CurrentRoom + ".tscn")
		get_tree().paused = false
	elif dataUseSave2 == true:
		var file = File.new()
		file.open("user://savegame2.json", File.READ)
		data1 = parse_json(file.get_as_text())
		file.close()
		
		automoveDirection = Vector2(data2.automoveDirection[0], data2.automoveDirection[1])
		#DealLater
		
		#G
		
		get_tree().change_scene("res://Rooms/" + CurrentRoom + ".tscn")
		get_tree().paused = false
func new_game():
	
	var file = File.new()
	file .open("user://savegame1.json", File.WRITE)
	var json = to_json(data1)
	file.store_line(json)
	
	#Add the same values during the beggining to the new save
	#Then Oppen to beggining room
	#get_tree().change_scene("res://Rooms/" + CurrentRoom + ".tscn")
	#get_tree().paused = false
