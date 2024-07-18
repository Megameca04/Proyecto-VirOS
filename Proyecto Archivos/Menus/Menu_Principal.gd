extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_inicio_juego_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_GAME)

func _on_tutorial_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.TUTORIAL_MENU)

func _on_creditos_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.CREDITS_MENU)
