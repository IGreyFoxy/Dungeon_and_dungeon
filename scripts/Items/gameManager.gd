extends Node
signal inventory_changed

var inventory = {}
var items_rare = [
	"common",
	"rare",
	"epic",
	"legendary"
]
func pause_game():
	get_tree().paused = true

func continue_game():
	get_tree().paused = false

func add_item(item,item_name,item_type,item_rare,item_desc,item_mesh,max_stack_size = 6,item_quantity = 1, icon = null,equipment = null):
	var x = item_rare
	if inventory.has(item):
		if inventory[item].type == 0 or 1 or 2:
			if inventory[item].quantity <= max_stack_size:
				inventory[item].quantity += item_quantity
				print('o')
		elif inventory[item].type == 3 or 4 or 5 or 6 or 7:
			if inventory[item].eqip == 0:
				inventory.remove(item,1)
				var dropitem = load("res://scenes/Items/default_helm.tscn")
				dropitem.global_transform.origin = get_tree().get_root().get_node('GG').global_tranform.origin + Vector3(1,0,0)
				get_tree().add_child(dropitem)
				print('fuck')
		
	else:
		inventory[item] = {
			'item' : item,
			'item_name' : item_name,
			'quantity' : item_quantity,
			'desc' : item_desc,
			'icon' : icon,
			'type' : item_type,
			'rare' : items_rare[x],
			'mesh' : item_mesh,
			'equip' : equipment
		}
		print(inventory)
	emit_signal("inventory_changed")


	
func remove(item,quantity):
	if inventory.has(item):
		if quantity != -1:
			inventory[item].quantity -= quantity
			if inventory[item].quantity < 1:
				inventory.erase(item)
		else:
			inventory.erase(item)
func get_all_inventory():
	return inventory
