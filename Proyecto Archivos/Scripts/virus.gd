extends MarginContainer

func _ready():
	$Timer.start()

func _on_timer_timeout():
	if randf() > 0.5:
		var nueva_instancia = Singletons.VIRUS.instantiate()
		add_sibling(nueva_instancia)

