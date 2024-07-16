extends PanelContainer

@onready var initial_pos := get_global_position()

func reset_pos():
	global_position = initial_pos

func set_mode(mode : int):
	if mode == 0:
		pass
