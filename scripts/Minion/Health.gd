extends TextureProgress

var bar_red = preload("res://assets/barHorizontal_red.png")
var bar_green = preload("res://assets/barHorizontal_green.png")
var bar_yellow = preload("res://assets/barHorizontal_yellow.png")



func update_healthbar(amount,full):
	texture_progress = bar_green
	if amount < full * 0.75:
		texture_progress = bar_yellow
	if amount < full * 0.45:
		texture_progress = bar_red
	value = amount
