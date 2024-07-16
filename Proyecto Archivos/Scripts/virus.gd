extends MarginContainer

const VIRUS = preload("res://Escenas/Virus.tscn") 

# Called when the node enters the scene tree for the first time.

func _ready():
	$Timer.start()

func _on_timer_timeout():
	var nueva_instancia = VIRUS.instantiate()
	add_sibling(nueva_instancia)

