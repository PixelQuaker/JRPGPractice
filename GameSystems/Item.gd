extends Node2D

onready var MarranitosText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Marranitos/Marranitos")
onready var TortaText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Torta/Torta")
onready var ConchaText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Concha/Concha")
onready var FlanText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Flan/Flan")
onready var quesadillaText : Node = get_node("Invi/ScrollContainer/VBoxContainer/quesadilla/quesadilla")
onready var BizcochoText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Bizcocho/Bizcocho")
onready var GalletaText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Galleta/Galleta")
onready var PolvoronText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Polvoron/Polvoron")
onready var CafeText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Cafe/Cafe")
onready var ChicharronText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Chicharron/Chicharron")
onready var RompopeText : Node = get_node("Invi/ScrollContainer/VBoxContainer/Rompope/Rompope")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called when the node enters the scene tree for the first time.
func _ready():
	Global.cansee = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Global.MarranitosHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Marranitos.visible = false
	if Global.MarranitosHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Marranitos.visible = true

	if Global.TortaHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Torta.visible = false
	if Global.TortaHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Torta.visible = true	

	if Global.ConchaHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Concha.visible = false
	if Global.ConchaHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Concha.visible = true	

	if Global.FlanHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Flan.visible = false
	if Global.ConchaHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Concha.visible = true	

	if Global.quesadillaHave == 0:
		$Invi/ScrollContainer/VBoxContainer/quesadilla.visible = false
	if Global.quesadillaHave > 0:
		$Invi/ScrollContainer/VBoxContainer/quesadilla.visible = true	


	if Global.BizcochoHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Bizcocho.visible = false
	if Global.BizcochoHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Bizcocho.visible = true	

	if Global.GalletaHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Galleta.visible = false
	if Global.GalletaHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Galleta.visible = true	

	if Global.PolvoronHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Polvoron.visible = false
	if Global.PolvoronHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Polvoron.visible = true	


	if Global.CafeHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Cafe.visible = false
	if Global.CafeHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Cafe.visible = true	

	if Global.ChicharronHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Chicharron.visible = false
	if Global.ChicharronHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Chicharron.visible = true	

	if Global.RompopeHave == 0:
		$Invi/ScrollContainer/VBoxContainer/Rompope.visible = false
	if Global.RompopeHave > 0:
		$Invi/ScrollContainer/VBoxContainer/Rompope.visible = true	

	if Global.cansee == false:
		$Invi.visible = false
	if Global.cansee == true:
		$Invi.visible = true
	var TMarranitos = ""
	TMarranitos += "Marranitos x" + str(Global.MarranitosHave)
	MarranitosText.text = TMarranitos

	var TTorta = ""
	TTorta += "Torta x" + str(Global.TortaHave)
	TortaText.text = TTorta

	var TConcha = ""
	TConcha += "Concha x" + str(Global.ConchaHave)
	ConchaText.text = TConcha

	var TFlan = ""
	TFlan += "Flan x" + str(Global.FlanHave)
	FlanText.text = TFlan

	var Tquesadilla = ""
	Tquesadilla += "Quesadilla x" + str(Global.quesadillaHave)
	quesadillaText.text = Tquesadilla

	var TBizcocho = ""
	TBizcocho += "Bizcocho x" + str(Global.BizcochoHave)
	BizcochoText.text = TBizcocho

	var TGalleta = ""
	TGalleta += "Galleta x" + str(Global.GalletaHave)
	GalletaText.text = TGalleta


	var TPolvoron = ""
	TPolvoron += "Polvoron x" + str(Global.PolvoronHave)
	PolvoronText.text = TPolvoron

	var TCafe = ""
	TCafe += "Cafe x" + str(Global.CafeHave)
	CafeText.text = TCafe

	var TChicharron = ""
	TChicharron += "Chicharron x" + str(Global.ChicharronHave)
	ChicharronText.text = TChicharron

	var TRompope = ""
	TRompope += "Rompope x" + str(Global.RompopeHave)
	RompopeText.text = TRompope
	pass


func _on_MarranitosUse_pressed():
	if Global.MarranitosHave > 0:
		if Global.Health + 15 <= Global.TotalHP:
			Global.Health += 15
		elif Global.Health + 15 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.MarranitosHave -= 1
		Global.cansee = false

	pass # Replace with function body.


func _on_TortaUse_pressed():
	if Global.TortaHave > 0:
		if Global.Health + 52 <= Global.TotalHP:
			Global.Health += 52
		elif Global.Health + 52 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.TortaHave -= 1
		Global.cansee = false
	pass # Replace with function body.


func _on_ConchaUse_pressed():
	if Global.ConchaHave > 0:
		if Global.Health + 30 <= Global.TotalHP:
			Global.Health += 30
		elif Global.Health + 30 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.ConchaHave -= 1
		Global.cansee = false

	pass # Replace with function body.


func _on_FlanUse_pressed():
	if Global.ConchaHave > 0:
		if Global.Health + 5 <= Global.TotalHP:
			Global.Health += 5
		elif Global.Health + 5 >= Global.TotalHP:
			Global.Health = Global.TotalHP

		if Global.PP + 25 <= Global.TotalPP:
			Global.PP += 25
		elif Global.PP + 25 >= Global.TotalPP:
			Global.PP = Global.TotalPP
		Global.ConchaHave -= 1

		Global.cansee = false
	pass # Replace with function body.


func _on_quesadillaUse_pressed():
	if Global.quesadillaHave > 0:
		if Global.Health + 20 <= Global.TotalHP:
			Global.Health += 20
		elif Global.Health + 20 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.quesadillaHave -= 1
		Global.cansee = false
	pass # Replace with function body.


func _on_BizcochoUse_pressed():
	if Global.BizcochoHave > 0:
		if Global.Health + 25 <= Global.TotalHP:
			Global.Health += 25
		elif Global.Health + 25 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.BizcochoHave -= 1
		Global.cansee = false

	pass # Replace with function body.


func _on_GalletaUse_pressed():
	if Global.GalletaHave > 0:
		if Global.Health + 5 <= Global.TotalHP:
			Global.Health += 5
		elif Global.Health + 5 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.GalletaHave -= 1
		Global.cansee = false
	pass # Replace with function body.


func _on_PolvoronUse_pressed():
	if Global.PolvoronHave > 0:
		if Global.Health + 8 <= Global.TotalHP:
			Global.Health += 8
		elif Global.Health + 8 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.PolvoronHave -= 1
		Global.cansee = false

	pass # Replace with function body.


func _on_CafeUse_pressed():
	if Global.CafeHave > 0:
		if Global.Health + 2 <= Global.TotalHP:
			Global.Health += 2
		elif Global.Health + 2 >= Global.TotalHP:
			Global.Health = Global.TotalHP

		if Global.PP + 10 <= Global.TotalPP:
			Global.PP += 10
		elif Global.PP + 10 >= Global.TotalPP:
			Global.PP = Global.TotalPP
		Global.CafeHave -= 1
		Global.cansee = false

	pass # Replace with function body.


func _on_ChicharronUse_pressed():
	if Global.ChicharronHave > 0:
		if Global.Health + 8 <= Global.TotalHP:
			Global.Health += 8
		elif Global.Health + 8 >= Global.TotalHP:
			Global.Health = Global.TotalHP
		Global.ChicharronHave -= 1
		Global.cansee = false
	pass # Replace with function body.


func _on_RompopeUse_pressed():
	if Global.RompopeHave > 0:
		if Global.Health + 10 <= Global.TotalHP:
			Global.Health += 10
		elif Global.Health + 10 >= Global.TotalHP:
			Global.Health = Global.TotalHP

		if Global.PP + 35 <= Global.TotalPP:
			Global.PP += 35
		elif Global.PP + 35 >= Global.TotalPP:
			Global.PP = Global.TotalPP
		Global.RompopeHave -= 1

		Global.cansee = false
	pass # Replace with function body.
