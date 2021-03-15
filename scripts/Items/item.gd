extends Area
class_name Item

export var key : String
export var item_name : String

export var max_stackable_size = 50
export var quantity = 1


enum ItemType {
	flask,
	gold,
	drop_for_craft,
	scarf,
	drop_for_craft_from_Bosses,
	mutation_from_Bosses,
	equipment,
	buff_weapon
}
enum ItemRare {
	common,
	rare,
	epic,
	legendary
}
enum Equipment {
	helm,
	armor,
	legs,
	boots,
	weapon,
	default_item
}
export(ItemType) var type
export(ItemRare) var rare
export(Equipment) var equip
export var texture : Texture
export var mesh : Mesh
export var desc : Texture
#var velocity = Vector3()
#var can_downing = true
#func _physics_process(delta):
#	if can_downing:
#		transform.origin += velocity * delta
#		velocity.y -= .01
func _on_bone_body_entered(body):
	if body.is_in_group('Player'):
		if GameManager.inventory.has(key) and GameManager.inventory[key].quantity == max_stackable_size:
			pass
		elif GameManager.inventory.has(key) and GameManager.inventory[key].type == 3 or 4 or 5 or 6 or 7:
			GameManager.add_item(key,item_name,type,rare,desc,mesh,max_stackable_size,quantity,texture,equip)
			queue_free()
		else:
			GameManager.add_item(key,item_name,type,rare,desc,mesh,max_stackable_size,quantity,texture,equip)
			queue_free()

#func _on_bone_area_entered(area):
#	if area.is_in_group('floor'):
#		can_downing = false
