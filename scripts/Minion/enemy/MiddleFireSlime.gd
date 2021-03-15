extends FireSlime

var fire_slimes = [
	load("res://scenes/Minion/Enemy/MicroFireSlime.tscn"),
	load("res://scenes/Minion/Enemy/MicroSlime.tscn")
]
func die():
	queue_free()
	spawn_slime(fire_slimes)
