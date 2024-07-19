extends Control

func _on_inicio_juego_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_GAME)

func _on_tutorial_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.TUTORIAL_MENU)

func _on_creditos_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.CREDITS_MENU)

func _on_inicio_juego_button_down():
	$AudioStreamPlayer.play()
