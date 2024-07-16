extends GridContainer


# Called when the node enters the scene tree for the first time.
var instancia_hija = preload("res://Escenas/virus.tscn") # Intervalo en segundos

func _ready():
	pass

func _on_timer_timeout():
	var nueva_instancia = instancia_hija.instantiate()
	add_child(nueva_instancia)
