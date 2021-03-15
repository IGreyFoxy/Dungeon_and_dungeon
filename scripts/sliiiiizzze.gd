extends Area

export var slowpercent = 0.5


	
	
func _on_sliiiiizzze_body_entered(body):
	if body.is_in_group('Player') and body.has_method('slow'):
		body.slow(slowpercent)


func _on_sliiiiizzze_body_exited(body):
	if body.is_in_group('Player') and body.has_method('slow'):
		body.slow(0.8)


func _on_LifeTimer_timeout():
	queue_free()


