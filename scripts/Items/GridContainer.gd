extends GridContainer
var paked_item_label = load("res://scenes/Minion/GG/GUI/Show_desc.tscn")
export var need_type : int
export var type_equip : int = 5
func _ready():
	GameManager.connect('inventory_changed',self,'_on_inventory_changed')

func _on_inventory_changed():
	for n in get_children():
		n.queue_free()
	
	for item in GameManager.inventory:
		if GameManager.inventory[item].type == need_type:
			if GameManager.inventory[item].equip == type_equip:
				var item_label = paked_item_label.instance()
#				item_label.text = '%s x%d' % [GameManager.inventory[item].item_name, GameManager.inventory[item].quantity]
				item_label.icon = GameManager.inventory[item].icon
				add_child(item_label)
				item_label.key = GameManager.inventory[item].item
			elif type_equip == 5:
				var item_label = paked_item_label.instance()
				item_label.text = '%s x%d' % [GameManager.inventory[item].item_name, GameManager.inventory[item].quantity]
				item_label.icon = GameManager.inventory[item].icon
				add_child(item_label)
				item_label.key = GameManager.inventory[item].item
