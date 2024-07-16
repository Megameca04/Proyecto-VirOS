extends Control

var selected_pool = []

var current_foc_win = null
var last_foc_win = null

func clicked_file(file: Object, button : int):
	if last_foc_win == null:
		last_foc_win = current_foc_win
		
	if last_foc_win != current_foc_win or last_foc_win.find_child(file.name) == null:
		
		for i in selected_pool:
			i.is_selected = false
		
		selected_pool.clear()
		last_foc_win = current_foc_win
	else:
		
		if button == 1:
			$ManejoArchivos.global_position = get_global_mouse_position()
			$ManejoArchivos.move_to_front()
		
		if button == 0:
			
			if !Input.is_action_pressed("LControl"):
				for i in selected_pool:
					i.is_selected = false
				
				selected_pool.clear()
			
			selected_pool.append(file)
				
			for i in selected_pool:
				i.is_selected = true
	

func connect_file(file):
	file.connect("clicked",Callable(self,"clicked_file"))

func focuss_window(window):
	current_foc_win = window
