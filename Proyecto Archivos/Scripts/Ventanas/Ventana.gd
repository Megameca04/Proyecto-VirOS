extends Control

signal file_clicked(window : Object, file : Object, button : int)
signal show_clipboard(coord  : Vector2)
signal hide_clipboard()

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

@onready var Grid := $Cuerpo/ScrollContainer/GridContainer
@onready var aud_clon := Callable(self,"play_sfx_cloning")

func _ready():
	connect("file_clicked",Callable(get_parent(),"clicked_file"))
	connect("show_clipboard",Callable(get_parent(),"show_clipboard"))
	connect("hide_clipboard",Callable(get_parent(),"hide_clipboard"))
	
	for i in randi_range(1,5):
		var new_file = Singletons.FILE.instantiate()
		
		Grid.add_child(new_file)
		
		new_file.connect("clicked", Callable(self,"get_clicked_file"))

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

func add_file(file: Object , copy : bool):
	if copy:
		Grid.add_child(file)
		if !file.is_in_group("Virus"):
			file.connect("clicked", Callable(self,"get_clicked_file"))
	else:
		file.reparent(Grid)

func remove_file(file : Object):
	call_deferred("remove_child",file)

func play_sfx_cloning():
	if !$VirusClonado.playing:
		$VirusClonado.play()

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
		show_clipboard.emit(self, get_global_mouse_position())

func _on_barra_titulo_gui_input(event):
	if event is InputEventMouseButton and event.button_index == 1:
		if event.is_pressed():
			can_move = true
			initial_mov_pos = global_position
			init_mou_pos = get_global_mouse_position()
			moved.emit()
		else:
			can_move = false
