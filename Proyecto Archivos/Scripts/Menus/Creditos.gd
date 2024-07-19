extends Control

func _on_button_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)

func _on_button_button_down():
	$AudioStreamPlayer.play()
