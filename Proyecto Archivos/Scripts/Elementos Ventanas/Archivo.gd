extends Control

signal clicked(file : Object, button : int)

var is_selected = false

const NAMES = {"KEY_0":"ensayo-1",
	1:"Ensayo-3.5-Oficial",
	2:"poemas-profundos",
	3:"diario [NO_LEER]",
	4:"nombres-banda",
	5:"SUPERguion"}

func _ready():
	$Label.text = "[center]"+NAMES[randi_range(1,5)]

func _process(_delta):
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
