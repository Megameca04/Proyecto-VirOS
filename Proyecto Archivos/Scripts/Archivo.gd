extends MarginContainer

class_name Archivo

signal iniciar_virus_timer  # Nueva señal para iniciar el temporizador de "Virus"

var virus_scene = preload("res://Escenas/virus.tscn")

func _ready():
	# Configura el tiempo de vida aleatorio para esta instancia de "Archivo"
	var tiempo_de_vida = randi_range(1, 3)
	$Timer.set_wait_time(tiempo_de_vida)
	$Timer.set_one_shot(true)
	# Verifica si hay un "Virus" presente
	_check_for_virus()

func _check_for_virus():
	for child in get_tree().get_nodes_in_group("archivos"):
		if child is Virus:
			# Inicia el temporizador
			$Timer.start()

			# Envía la señal para iniciar el temporizador de "Virus"

func _on_timer_timeout():
	# Genera una nueva instancia de "Virus"
	var nueva_instancia_virus = virus_scene.instantiate()
	add_sibling(nueva_instancia_virus)
	emit_signal("iniciar_virus_timer")
	# Autodestrucción de esta instancia de "Archivo"
	queue_free()
