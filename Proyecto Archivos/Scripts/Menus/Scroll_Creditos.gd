extends ScrollContainer

# Llamado cuando se mueve el mouse dentro del ScrollContainer
var movimiento = 0
var velocidad = 5
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Obtén el desplazamiento del mouse en píxeles
		var delta = event.relative
		if movimiento >= -80 and movimiento<= 1800:
			movimiento += delta.y * velocidad
		elif movimiento > 1800:
			movimiento -= velocidad
		elif movimiento < -80:
			movimiento += velocidad
		# Ajusta la posición de desplazamiento del ScrollContainer
		print(movimiento)
		set_v_scroll(movimiento)
