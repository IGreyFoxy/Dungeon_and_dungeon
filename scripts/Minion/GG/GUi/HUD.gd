extends CanvasLayer



var bar_red = preload("res://assets/barHorizontal_red.png")
var bar_green = preload("res://assets/barHorizontal_green.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow.png")
var texture_progress


func update_healthbar(amount,full):
	texture_progress = bar_green
	if amount < full * 0.75:
		texture_progress = bar_yellow
	if amount < full * 0.45:
		texture_progress = bar_red
	$GUI/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Health.texture_progress = texture_progress
	$GUI/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/Health.value = amount
	


func update_staminabar(amount,full):
	texture_progress = bar_green
	if amount < full * 0.75:
		texture_progress = bar_yellow
	if amount < full * 0.45:
		texture_progress = bar_red
	$GUI/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/staminabar.texture_progress = texture_progress
	$GUI/MarginContainer/VBoxContainer/HBoxContainer/VBoxContainer/staminabar.value = amount






func _on_Invemtory_button_pressed():
	GameManager.pause_game()
	$GUI.hide()
	$Inventory.show()


func _on_Exit_from_invetory_pressed():
	GameManager.continue_game()
	$GUI.show()
	$Inventory.hide()


func _on_Map_pressed():
	GameManager.pause_game()
	$GUI.hide()
	$map.show()

func _on_Settings_or_pause_pressed():
	GameManager.pause_game()
	$GUI.hide()







