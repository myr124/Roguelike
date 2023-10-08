extends Node2D

var itemDict = {
	"Extra lives" : 20 , 
	"2X Damage" : 20, 
	"Health Potion" : 5,
	"Fairy Dust" : 10,
	"Titan Armor" : 30,
	"Arrows" : 5,
	"Cursed Rock" : 30,
	"Antique Necklace": 25,
	"Power Gauntlet" : 35,
	"Quick Crossbow" : 50,
	"Fiery Greatsword" : 45,
	"Wooden Shield" : 30,
	"Nimble Boots" : 40,
	"Light Dagger" : 25,
	"Dual Axes" : 60
 }

#var $StoreButton: Button
var keys = itemDict.keys()
var item

func _ready():
	var VSplit1 = get_node("GridContainer/VSplitContainer")
	VSplit1.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit2 = get_node("GridContainer/VSplitContainer2")
	VSplit2.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit3 = get_node("GridContainer/VSplitContainer3")
	VSplit3.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit4 = get_node("GridContainer/VSplitContainer4")
	VSplit4.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit5 = get_node("GridContainer/VSplitContainer5")
	VSplit5.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit6 = get_node("GridContainer/VSplitContainer6")
	VSplit6.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit7 = get_node("GridContainer/VSplitContainer7")
	VSplit7.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit8 = get_node("GridContainer/VSplitContainer8")
	VSplit8.connect("update_currency_label", updateCurrencyLabel)
	
	var VSplit9 = get_node("GridContainer/VSplitContainer9")
	VSplit9.connect("update_currency_label", updateCurrencyLabel)
	updateCurrencyLabel()
	

func updateCurrencyLabel():
	var label = get_node("CoinsLabel")
	label.text = "Coins: " + str(GlobalStats.currency)


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


	


	
	


	



