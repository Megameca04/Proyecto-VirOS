extends Control

var selected_pool = []

var last_foc_win = null

func clicked_file(window : Object, file : Object, button : int):
	
	if last_foc_win == null:
		last_foc_win = window
	
	if last_foc_win != window:
		clear_selection()
		last_foc_win = window
	else:
		manage_click(file, button)

func clear_selection():
	for i in selected_pool:
		i.is_selected = false
	
	selected_pool.clear()

func manage_click(file : Object, button : int):
	if button == 1:
		$ManejoArchivos.global_position = get_global_mouse_position()
		$ManejoArchivos.move_to_front()
		
	if button == 0:
		
		if !Input.is_action_pressed("LControl"):
			clear_selection()
		
		selected_pool.append(file)
		
		for i in selected_pool:
			i.is_selected = true

func connect_file(file):
	file.connect("clicked",Callable(self,"clicked_file"))
