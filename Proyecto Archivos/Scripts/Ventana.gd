extends Control

signal focussed(window)

enum ClickStates {
	NONE,
	PRESSED
}

var current_click = ClickStates.NONE

var on_top_bar := false
var on_window := false
var offset := Vector2.ZERO

func _ready():
	connect("focussed",Callable(get_parent(),"focuss_window"))
	print("focussed conectada")
	for i in randi_range(1,5):
		var new_file = preload("res://Escenas/Archivo.tscn").instantiate()
		$Cuerpo/ScrollContainer/GridContainer.add_child(new_file)

func _physics_process(delta):

func _physics_process(delta): 
	var timer = $Timer.get_time_left()
	$Cuerpo/Label.text =(
		"Click: " + str(current_click) +
		"\nOn_TB: " + str(on_top_bar) +
		"\nOn_window: " +str(on_window)+
		"\nZ_index: " + str(z_index)+
		"\nTimer: " + str(timer)
		)
	
	if Input.is_action_just_pressed("l_click"):
		if on_top_bar or on_window:
			move_to_front()
			focussed.emit(self)
	
	if on_top_bar:
		if current_click == ClickStates.PRESSED:
			global_position = get_global_mouse_position() - offset
		else:
			offset = get_local_mouse_position()

func _input(event):
	if event.is_action_pressed("l_click"):
		current_click = ClickStates.PRESSED
	if event.is_action_released("l_click"):
		current_click = ClickStates.NONE

func _on_barra_titulo_mouse_entered():
	on_top_bar = true

func _on_barra_titulo_mouse_exited():
	on_top_bar = false
	offset = Vector2.ZERO

func _on_mouse_entered():
	on_window = true

func _on_mouse_exited():
	on_window = false
