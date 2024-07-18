extends ScrollContainer

# Llamado cuando se mueve el mouse dentro del ScrollContainer
var movimiento = 0

func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Obtén el desplazamiento del mouse en píxeles
		var delta = event.relative
		movimiento += delta.y * 2
		
		# Ajusta la posición de desplazamiento del ScrollContainer
		set_v_scroll(movimiento)
