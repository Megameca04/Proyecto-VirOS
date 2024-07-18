class_name Ventana
extends Control

var selected_pool = []
var files_in_clipboard = []

var last_foc_win = null

@onready var Clipboard = $Clipboard

var window_with_clipboard = null

func _ready():
	
	spawn_virus()


func clicked_file(window : Object, file : Object, button : int):
	if button == 0:
		hide_clipboard()
	
	if last_foc_win == null:
		last_foc_win = window
		
	
	if last_foc_win != window:
		clear_selection()
		last_foc_win = window
		last_foc_win.move_to_front()
	else:
		last_foc_win.move_to_front()
		manage_click(file, button)

func clear_selection():
	for i in selected_pool:
		i.is_selected = false
	
	selected_pool.clear()

func manage_click(file : Object, button : int):
	
	if button == 1 and selected_pool.size() > 0 :
		Clipboard.show_at(0,get_global_mouse_position())
		
	if button == 0:
		
		if !Input.is_action_pressed("LControl"):
			clear_selection()
		
		selected_pool.append(file)
		
		for i in selected_pool:
			i.is_selected = true

func show_clipboard(window,coord):
	window.move_to_front()
	window_with_clipboard = window
	Clipboard.show_at(1,coord)

func select_files():
	files_in_clipboard.clear()
	for i in selected_pool:
		files_in_clipboard.append(i)

func hide_clipboard():
	Clipboard.reset_pos()

func move_files(copy : bool):
	if copy == true:
		for i in files_in_clipboard:
			if !i.is_in_group("Limpiador"):
					window_with_clipboard.add_file(Singletons.FILE.instantiate(),true)
			else:
					window_with_clipboard.add_file(Singletons.CLEANER.instantiate(),true)
		hide_clipboard()
	else:
		for i in files_in_clipboard:
			window_with_clipboard.add_file(i,false)
		files_in_clipboard.clear()
		clear_selection()
		hide_clipboard()

func spawn_virus():
	var infected_first_window = false
	for i in get_children():
		if i.is_in_group("Ventana"):
			if randi_range(1,3) == 1 or !infected_first_window:
				i.add_file(Singletons.VIRUS.instantiate(),true)
				infected_first_window = true
