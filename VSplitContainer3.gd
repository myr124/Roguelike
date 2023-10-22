extends VSplitContainer
signal update_currency_label

var keys = GlobalStats.itemDict.keys()

var item
var label


# Called when the node enters the scene tree for the first time.
func _ready():
	item = setItem()
	emit_signal("update_currency_label")



func buyItem():
	var item_cost = GlobalStats.itemDict[item][0]
	
	if GlobalStats.currency >= item_cost:
		GlobalStats.currency -= item_cost
		emit_signal("update_currency_label")
		# Update the currency label or perform other actions
	#else:
		# Handle the case when the player doesn't have enough currency

func setItem():
	var randomItem = keys[randi() % keys.size()]
	var button = get_node("StoreButton3")
	button.text = randomItem + " " + str(GlobalStats.itemDict[randomItem][0]) + "\u00A9"
	
	var image = get_node("TextureRect3")
	image.texture = load(GlobalStats.itemDict[randomItem][1])
	return randomItem



func _on_store_button_3_pressed():
	buyItem()
