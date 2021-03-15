#extends Resource 
#class_name Inventory
#
#signal inventory_changed 
#
#export var _items = [] setget set_items, get_items
#
#func set_items(new_item):
#	_items = new_item
#	emit_signal("inventory_changed",self)
#
#func get_items():
#	return _items
#
#func get_item(index):
#	return _items[index]
#
#func add_item(item_name,quantity):
#	if quantity <= 0:
#		print("Can't add negative number of items")
#		return
#	var item = ItemDatabase.get_item(item_name)
#	if not item:
#		print('cloud not find item')
#		return
#	var remaning_quantity = quantity
#	var max_stack_size = item.max_stack_size if item.stackable else 1
#
#
#	if item.stackable:
#		for i in range(_items.size()):
#			if remaning_quantity == 0:
#				break
#
#			var inventory_item = _items[i]
#
#			if inventory_item.quantity < max_stack_size:
#				var original_quantity = inventory_item.quantity
#				inventory_item.quantity = min(original_quantity + remaning_quantity,max_stack_size)
#				remaning_quantity -= inventory_item.quantity - original_quantity
#
#	while remaning_quantity > 0:
#		var new_item = {
#			itemm_reference = item, 
#			quantity = min(remaning_quantity,max_stack_size)
#		}
#		_items.append(new_item)
#		remaning_quantity -= new_item.quantity
#	emit_signal("inventory_changed",self)
