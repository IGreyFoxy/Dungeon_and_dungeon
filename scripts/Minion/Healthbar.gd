extends Sprite3D
onready var bar = $Viewport/Health
func _ready():
	texture = $Viewport.get_texture()
func update(amount,full):
	bar.update_healthbar(amount,full)



