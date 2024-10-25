extends Control

signal clicked(file : Object, button : int)

const NAMES = {
	0:"Warfarin",
	1:"Mambo 36",
	2:"Salvacolina",
	3:"AM-BIEN",
	4:"BACTRO-BAN",
	5:"VERONAL"}

var is_selected = false

func _ready():
	$Label.text = "[center]"+NAMES[randi_range(0,5)]

func _process(_delta):
	if is_selected:
		$Panel.show()
	else:
		$Panel.hide()

func _on_gui_input(event : InputEvent):
	if event is InputEventMouseButton:
		if event.is_action_pressed("r_click"):
			clicked.emit(self,1)
		if event.is_action_pressed("l_click"):
			clicked.emit(self, 0)


func _on_timer_timeout():
	
	var virus_in_window = []
	
	for i in get_parent().get_children():
		if i.is_in_group("Virus"):
			virus_in_window.append(i) 
	
	if virus_in_window.size() > 0:
		var to_erase = virus_in_window.pick_random()
		to_erase.queue_free()
		
		if randf() < 0.33:
			$MarginContainer/TextureRect.texture = load("res://Sprites/Iconos/pillDeath.png")
			$Timer.one_shot = true
			$Timer.stop()
