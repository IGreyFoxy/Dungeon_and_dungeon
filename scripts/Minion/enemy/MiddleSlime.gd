extends Slime

var microslimes = [
	load("res://scenes/Minion/Enemy/MicroSlime.tscn"),
	load("res://scenes/Minion/Enemy/MicroSlime.tscn"),
	
	]

func die():
	queue_free()
	spawn_slime(microslimes)

