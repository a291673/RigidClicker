extends KinematicBody2D

func _ready():
	pass
	set_process(true)
		
func _process(delta):
	set_position(Vector2(get_viewport().get_mouse_position().x+20,get_viewport().get_mouse_position().y+20))

