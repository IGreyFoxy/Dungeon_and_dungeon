extends Weapon
class_name Range_Weapon

export var max_fireboolspeed = 10
var fireboolspeed=max_fireboolspeed
var velocity = Vector3()

func start(xform):
	transform = xform
	velocity = transform.basis.x * fireboolspeed 

	
	

func _physics_process(delta):
	transform.origin += velocity * delta


func _on_firebool_body_entered(body):
	if body.has_method('_on_hitbox_area_entered'):
		body._on_hitbox_area_entered(damage)
		
	
	queue_free()
	

func _on_lifeTime_timeout():
	queue_free()
