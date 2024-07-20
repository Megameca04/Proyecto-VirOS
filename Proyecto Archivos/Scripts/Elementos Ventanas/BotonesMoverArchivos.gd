extends PanelContainer

signal select_files()
signal move_files(copy : bool)
signal erase_file()

var copy_at_move = false

@onready var initial_pos := get_global_position()

@onready var Copiar = $HBoxContainer/Copiar
@onready var Cortar = $HBoxContainer/Cortar
@onready var Pegar = $HBoxContainer/Pegar
@onready var Borrar = $HBoxContainer/Borrar

func _ready():
	connect("select_files",Callable(get_parent(),"select_files"))
	connect("move_files",Callable(get_parent(),"move_files"))
	connect("erase_file",Callable(get_parent(),"erase_files"))

func _process(_delta):
	size = $HBoxContainer.size

func reset_pos():
	global_position = initial_pos

func show_at(mode : int, coords :  Vector2):
	if mode == 0:
		Copiar.visible = true
		Cortar.visible = true
		Borrar.visible = true
		Pegar.visible = false
	elif mode == 1:
		Copiar.visible = false
		Cortar.visible = false
		Borrar.visible = false
		Pegar.visible = true
	
	global_position = coords
	move_to_front()

func _on_boton_copiar_pressed():
	select_files.emit()
	copy_at_move = true
	$Copiar.play()

func _on_boton_cortar_pressed():
	select_files.emit()
	copy_at_move = false
	$Cortar.play()

func _on_boton_pegar_pressed():
	move_files.emit(copy_at_move)
	$Pegar.play()

func _on_boton_borrar_pressed():
	erase_file.emit()
	$Cortar.play()
