extends Control

signal file_clicked(window : Object, file : Object, button : int)
signal show_clipboard(coord  : Vector2)
signal hide_clipboard()

enum ClickStates {
	NONE,
	PRESSED
}

var current_click = ClickStates.NONE
var cycles = -1

var on_top_bar := false
var on_window := false

var emmited_hide := false

var offset := Vector2.ZERO

@onready var Grid := $Cuerpo/VBoxContainer/GridContainer


func _ready():
	connect("file_clicked",Callable(get_parent(),"clicked_file"))
	connect("show_clipboard",Callable(get_parent(),"show_clipboard"))
	connect("hide_clipboard",Callable(get_parent(),"hide_clipboard"))
	
	
	add_new_cleaner()

func _physics_process(_delta): 
	
	if on_top_bar:
		if current_click == ClickStates.PRESSED:
			global_position = get_global_mouse_position() - offset
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

func add_new_cleaner():
	if Grid.get_child_count() < 5:
		for i in range(int(floor(1.0 + cycles/3.0))):
			if Grid.get_child_count() < 5:
				var nc = Singletons.CLEANER.instantiate()
				nc.connect("clicked", Callable(self,"get_clicked_file"))
				Grid.add_child(nc)
			else:
				break
		cycles += 1

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
		show_clipboard.emit(self, get_global_mouse_position())
