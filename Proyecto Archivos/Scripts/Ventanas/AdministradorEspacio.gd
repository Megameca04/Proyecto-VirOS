extends Control

signal file_clicked(window : Object, file : Object, button : int)
signal show_paste_menu(coord  : Vector2)
signal hide_clipboard()
signal game_ends(victory : bool)
signal moved()

enum ClickStates {
	NONE,
	PRESSED
}

var current_click = ClickStates.NONE

var on_top_bar := false
var on_window := false
var can_move := false
var emmited_hide := false

var offset := Vector2.ZERO
var initial_mov_pos := Vector2.ZERO
var init_mou_pos := Vector2.ZERO

var grupo_archivos = []  # Almacena los nodos en el grupo "Archivo"
var cantidad_de_archivos = 0
@export var max_cantidad_archivos = 80

var grupo_virus = []
var cantidad_virus = 0

var grupo_antivirus = []
var cantidad_antivirus = 0

@onready var progressBar =  $Cuerpo/VBoxContainer/MarginContainer/ProgressBar

func _ready():
	grupo_archivos = get_tree().get_nodes_in_group("Archivo")
	cantidad_de_archivos = grupo_archivos.size()
	progressBar.set_value(cantidad_de_archivos)
	
	grupo_virus = get_tree().get_nodes_in_group("Virus")
	cantidad_virus = grupo_virus.size()
	
	grupo_antivirus = get_tree().get_nodes_in_group("Limpiador")
	cantidad_antivirus = grupo_antivirus.size()
	# Puedes usar esta cantidad para lo que necesites (por ejemplo, mostrarla en la interfaz o realizar otras acciones).
	$Cuerpo/VBoxContainer/Label.set_text(
		"\n Total Archivos:    "+ str(cantidad_de_archivos) +
		"\n Virus Restantes:    "+ str(cantidad_virus)+
		"\n Limpiadores Activos:    "+ str(cantidad_antivirus)
	)
	
	progressBar.max_value = max_cantidad_archivos 

func _physics_process(_delta): 
	
	if can_move:
		global_position = initial_mov_pos + (get_global_mouse_position() - init_mou_pos)
	
	if on_top_bar:
		if current_click == ClickStates.PRESSED:
			move_to_front()
			if !emmited_hide:
				hide_clipboard.emit()
				emmited_hide = true
		else:
			offset = get_local_mouse_position()
			emmited_hide = false

func _input(event):
	if event.is_action_pressed("l_click"):
		current_click = ClickStates.PRESSED
	if event.is_action_released("l_click"):
		current_click = ClickStates.NONE

func get_clicked_file(file : Object, button : int):
	file_clicked.emit(self, file, button)

func _on_barra_titulo_mouse_entered():
	on_top_bar = true

func _on_barra_titulo_mouse_exited():
	on_top_bar = false
	offset = Vector2.ZERO

func _on_mouse_entered():
	on_window = true

func _on_mouse_exited():
	on_window = false

func _on_gui_input(event):
	if on_window and event.is_action_pressed("r_click"):
		show_paste_menu.emit(self, get_global_mouse_position())

func _on_timer_timeout():
	grupo_archivos = get_tree().get_nodes_in_group("Archivo")
	cantidad_de_archivos = grupo_archivos.size()
	progressBar.set_value(cantidad_de_archivos)
	
	grupo_virus = get_tree().get_nodes_in_group("Virus")
	cantidad_virus = grupo_virus.size()
	
	grupo_antivirus = get_tree().get_nodes_in_group("Limpiador")
	cantidad_antivirus = grupo_antivirus.size()
	
	# Puedes usar esta cantidad para lo que necesites (por ejemplo, mostrarla en la interfaz o realizar otras acciones).
	$Cuerpo/VBoxContainer/Label.set_text(
		"\n Total Archivos:    "+ str(cantidad_de_archivos) +
		"\n Virus Restantes:    "+ str(cantidad_virus)+
		"\n Limpiadores Activos:    "+ str(cantidad_antivirus)
	)
	
	if cantidad_de_archivos >= max_cantidad_archivos:
		game_ends.emit(false)
	
	if cantidad_virus <= 0:
		game_ends.emit(true)

func _on_barra_titulo_gui_input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed():
			can_move = true
			initial_mov_pos = global_position
			init_mou_pos = get_global_mouse_position()
			moved.emit()
		else:
			can_move = false
