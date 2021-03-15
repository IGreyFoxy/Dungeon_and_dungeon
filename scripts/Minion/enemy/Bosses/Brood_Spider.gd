extends Slime
var count = 0
var sp = true
var can_hit = true
var can_run = false
var spiders = [
	load("res://scenes/Minion/Enemy/Spider.tscn"),
	load("res://scenes/Minion/Enemy/ToxicSpider.tscn"),
	load("res://scenes/Minion/Enemy/Spider.tscn")
]
func _ready():
	$cooldown.start()

func die():
	queue_free()
func control(delta):
	if target and can_hit:
		look_at(target.global_transform.origin,Vector3(0,1,0))
		fire(firebool)
		if count < 3 and sp:
			spawn_slime(spiders)
			count+=1
			sp = false
			$cooldown.start()
			if count == 3:
				$can_runTimer.start()
		elif count == 3 and can_run:
			vel = (target.global_transform.origin - global_transform.origin)
			vel *= speed * delta * accel
			can_hit = false
			
			$StunTimer.start()
func spawn_slime(list):
	var s = []
	for a in list:
		s.append(a.instance())
	s[0].transform.origin = $Position3D.global_transform.origin
	s[1].transform.origin = $Position3D2.global_transform.origin
	s[2].transform.origin = $Position3D3.global_transform.origin
	add_child(s[0])
	add_child(s[1])
	add_child(s[2])

func _on_cooldown_timeout():
	sp = true




func _on_StunTimer_timeout():
	translate(Vector3(0,0,40))
	vel = Vector3()
	count = 0
	can_hit = true
	can_run = false







func _on_can_runTimer_timeout():
	can_run = true
	$can_runTimer.stop()


func _on_root_zone_body_entered(body):
	if body.is_in_group("Player"):
		body.mob_root()
	vel = Vector3()
