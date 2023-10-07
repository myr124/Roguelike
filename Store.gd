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
	updateCurrencyLabel()
	item = setItems()

func updateCurrencyLabel():
	$CoinsLabel.text = "Coins: " + str(GlobalStats.currency)

func buyItem():
	var item_cost = itemDict[item]
	
	if GlobalStats.currency >= item_cost:
		GlobalStats.currency -= item_cost
		updateCurrencyLabel()
		# Update the currency label or perform other actions
	#else:
		# Handle the case when the player doesn't have enough currency


func _on_back_button_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")


func _on_store_button_pressed():
	buyItem()

func setItems():
	var firstRandomItem = keys[randi() % keys.size()]
	$GridContainer/VSplitContainer/StoreButton.text = firstRandomItem + " " + str(itemDict[firstRandomItem]) + "\u00A9"
	
	for i in range(2,9):
		var randomItem = keys[randi() % keys.size()]
		$GridContainer/VSplitContainer/StoreButton.text = randomItem + " " + str(itemDict[randomItem]) + "\u00A9"
	
	


	



