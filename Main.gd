extends Node2D
onready var gondo = preload("res://gondos.tscn")

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
	for i in range(100):
		var g = gondo.instance()
		g.name = "gondo"+str(i%10)
		g.get_node("Sprite").set_texture(gondoIMG[i%10])
		add_child(g)
