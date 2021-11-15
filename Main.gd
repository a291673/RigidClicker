extends Node2D
onready var gondo = preload("res://Gondos.tscn")
signal gondoSignal
var score = 0
var buscado = 0

const gondoIMG = [
	 preload("res://images/0.png"),
	 preload("res://images/1.png"),
	 preload("res://images/2.png"),
	 preload("res://images/3.png"),
	 preload("res://images/4.png"),
	 preload("res://images/5.png"),
	 preload("res://images/6.png"),
	 preload("res://images/7.png"),
	 preload("res://images/8.png"),
	 preload("res://images/9.png"),
]
func _ready():
	buscado = rand_range(0,9)
	set_process(true)
	for i in range(Global.ngon):
		if(i%10!=buscado):
			var g = gondo.instance()
			g.name = "gondo"+str(i%10)
			g.get_node("Sprite").set_texture(gondoIMG[i%10])
			g.id = i
			add_child(g)
	var b = gondo.instance()
	b.name = "gondo"+str(buscado)
	b.get_node("Sprite").set_texture(gondoIMG[buscado])
	b.id = buscado
	add_child(b)
	$Sprite.set_texture(gondoIMG[buscado])
	Global.bus = buscado

func _process(_delta):
	$Score.text = "Score: "+str(score)
	score = Global.score
	if(Global.reset == 1):
		reset()

func reset():
	Global.reset = 0
	Global.ngon += 5
	get_tree().reload_current_scene()

