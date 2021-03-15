extends Slizneviy_Slime

var sliznevie_microslimes = [
	load("res://scenes/Minion/Enemy/MicroSlime.tscn"),
	load("res://scenes/Minion/Enemy/Slizneviy_MicroSlime.tscn"),
	
	]

func die():
	queue_free()
	spawn_slime(sliznevie_microslimes)
