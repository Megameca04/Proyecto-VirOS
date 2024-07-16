extends Container

signal clicked(file : Object, button : int)

var is_selected = false

func _process(delta):
	if is_selected:
		$Panel.show()
	else:
		$Panel.hide()

func _on_gui_input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.is_action_pressed("r_click"):
			clicked.emit(self,1)
		if event.is_action_pressed("l_click"):
			clicked.emit(self, 0)


