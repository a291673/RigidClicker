extends RigidBody2D

onready var screensize = get_viewport_rect().size

var id = 0
var vel = 0
var r = 0
func _ready():
	set_position(Vector2(rand_range(100,screensize.x-100),rand_range(100,screensize.y-100)))
	set_process(true)
	vel = Vector2(rand_range(-100,100),rand_range(-100,100))
	impulse(Vector2(rand_range(-100,100),rand_range(-100,100)))
	
#func _process(delta):

func impulse(amount):
	self.apply_central_impulse(amount)
	
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if(get_viewport().get_mouse_position().x>get_position().x+10 and get_viewport().get_mouse_position().x<get_position().x+60):
			if(get_viewport().get_mouse_position().y>get_position().y+10 and get_viewport().get_mouse_position().y<get_position().y+60):
				if(id==Global.bus):	
					Global.score += 50
					$kill.play()
				else:
					Global.score -=30
					$kill.play()

func _on_kill_finished():
	queue_free()
	$KillGondo
	if(id==Global.bus):	
		Global.reset = 1
