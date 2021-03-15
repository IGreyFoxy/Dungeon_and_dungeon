extends Button

var key
var item_label

var item_desc
func _on_Control_button_down():
	item_label = Label.new()
	item_desc = TextureRect.new()
	
	if GameManager.inventory.has(key):
		item_label.text = GameManager.inventory[key].rare
		item_desc.texture = GameManager.inventory[key].desc
		
		get_parent().add_child(item_desc)
		get_parent().add_child(item_label)
		print('s')

func _on_Control_button_up():
	item_desc.queue_free()
	item_label.queue_free()
	print('Up')




