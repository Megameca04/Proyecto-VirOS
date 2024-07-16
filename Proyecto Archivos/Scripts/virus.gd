extends MarginContainer

class_name Virus


var instancia_hermana = preload("res://Escenas/Virus.tscn") 

# Called when the node enters the scene tree for the first time.

func _ready():
	$Timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	var nueva_instancia = instancia_hermana.instantiate()
	add_sibling(nueva_instancia)
