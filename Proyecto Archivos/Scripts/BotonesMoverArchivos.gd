extends PanelContainer

signal select_files()
signal move_files(copy : bool)

var copy_at_move = false

@onready var initial_pos := get_global_position()

@onready var Copiar = $HBoxContainer/MarginContainer/BotonCopiar
@onready var Cortar = $HBoxContainer/MarginContainer2/BotonCortar
@onready var Pegar = $HBoxContainer/MarginContainer3/BotonPegar
@onready var Borrar = $HBoxContainer/MarginContainer4/BotonBorrar

func _ready():
	connect("select_files",Callable(get_parent(),"select_files"))
	connect("move_files",Callable(get_parent(),"move_files"))

func reset_pos():
	global_position = initial_pos

func show_at(mode : int, coords :  Vector2):
	if mode == 0:
		Copiar.show()
		Cortar.show()
		Borrar.show()
		Pegar.hide()
	elif mode == 1:
		Copiar.hide()
		Cortar.hide()
		Borrar.hide()
		Pegar.show()
	
	global_position = coords
	move_to_front()

func _on_boton_copiar_pressed():
	select_files.emit()
	copy_at_move = true

func _on_boton_cortar_pressed():
	select_files.emit()
	copy_at_move = false

func _on_boton_pegar_pressed():
	move_files.emit(copy_at_move)
	
