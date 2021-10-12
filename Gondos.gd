extends RigidBody2D

onready var screensize = get_viewport_rect().size

var id = 0
var vel = 0
var r = 0
var level = 1
var factor = 1
onready var  width = int(get_node("Sprite").texture.get_width()  * get_scale().x / 2)
onready var height = int(get_node("Sprite").texture.get_height() * get_scale().y / 2)
const VX = [[50,80], [90,120], [130,150], [150,180], [190,220]]
const VY = [[30,60], [55,90], [80,120], [110,150], [150,190]]
func _ready():
	set_position(Vector2(rand_range(100,screensize.x-100),rand_range(100,screensize.y-100)))
	set_process(true)
	vel = Vector2(rand_range(0,100),rand_range(0,100)).rotated(rand_range(0.4, PI/2))
	
func _process(delta):
	var pos = get_position()
	pos += vel * delta
	if pos.x >= 0 or pos.x <= -screensize.x:
		set_position(Vector2(screensize.x-50,pos.y))
		vel.x *= -1
	if pos.y >= screensize.y-50 or pos.y<= 0:
		set_position(Vector2(pos.x,screensize.y-110))
		vel.y *= -1
	set_position(pos)
	
