extends ScrollContainer

# Llamado cuando se mueve el mouse dentro del ScrollContainer
var movimiento = 0
var velocidad = 20
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		# Obtén el desplazamiento del mouse en píxeles
		var delta = event.relative
		if movimiento >= 0 and movimiento<= 838:
			movimiento += delta.y * velocidad
		elif movimiento > 838:
			movimiento -= velocidad
		elif movimiento < 0:
			movimiento += velocidad
		# Ajusta la posición de desplazamiento del ScrollContainer
		set_v_scroll(movimiento)
