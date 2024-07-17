class_name Ventana
extends Control

var selected_pool = []
var files_in_clipboard = []

var last_foc_win = null

@onready var Clipboard = $Clipboard

var window_with_clipboard = null

func clicked_file(window : Object, file : Object, button : int):
	
	if last_foc_win == null:
		last_foc_win = window
	
	if last_foc_win != window:
		clear_selection()
		last_foc_win = window
		last_foc_win.move_to_front()
	else:
		manage_click(file, button)

func clear_selection():
	for i in selected_pool:
		i.is_selected = false
	
	selected_pool.clear()

func manage_click(file : Object, button : int):
	if button == 1:
		Clipboard.show_at(0,get_global_mouse_position())
		
	if button == 0:
		
		if !Input.is_action_pressed("LControl"):
			clear_selection()
		
		selected_pool.append(file)
		
		for i in selected_pool:
			i.is_selected = true

func show_paste_menu(window,coord):
	window.move_to_front()
	window_with_clipboard = window
	Clipboard.show_at(1,coord)
	

func select_files():
	for i in selected_pool:
		files_in_clipboard.append(i)

func move_files(copy : bool):
	if copy == true:
		for i in files_in_clipboard:
			if !i.is_in_group("Limpiador"):
					window_with_clipboard.add_file(Singletons.FILE.instantiate(),true)
			else:
					window_with_clipboard.add_file(Singletons.CLEANER.instantiate(),true)
	else:
		for i in files_in_clipboard:
			window_with_clipboard.add_file(i,false)
		files_in_clipboard.clear()
		clear_selection()
