extends Control

signal file_clicked(window : Object, file : Object, button : int)
signal show_paste_menu(coord  : Vector2)

enum ClickStates {
	NONE,
	PRESSED
}

var current_click = ClickStates.NONE

var on_top_bar := false
var on_window := false
var offset := Vector2.ZERO

func _ready():
	connect("file_clicked",Callable(get_parent(),"clicked_file"))
	connect("show_paste_menu",Callable(get_parent(),"show_paste_menu"))
	print("focussed conectada")
	for i in randi_range(1,5):
		var new_file = preload("res://Escenas/Archivo.tscn").instantiate()
		
		$Cuerpo/ScrollContainer/GridContainer.add_child(new_file)
		
		new_file.connect("clicked", Callable(self,"get_clicked_file"))

func _physics_process(_delta): 
	
	if on_top_bar:
		if current_click == ClickStates.PRESSED:
			global_position = get_global_mouse_position() - offset
		else:
			offset = get_local_mouse_position()

func add_file( file: Object):
	file.reparent($Cuerpo/ScrollContainer/GridContainer)

func remove_file(file : Object):
	call_deferred("remove_child",file)

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
