extends Control

var on_top_bar := false
var offset := Vector2.ZERO

func _process(delta):
	if on_top_bar:
		if Input.is_action_pressed("l_click"):
			global_position = get_global_mouse_position() - offset
		else:
			offset = get_local_mouse_position()

func _on_barra_titulo_mouse_entered():
	on_top_bar = true

func _on_barra_titulo_mouse_exited():
	on_top_bar = false
	offset = Vector2.ZERO
