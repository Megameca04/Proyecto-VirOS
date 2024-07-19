extends Control

func _on_menu_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)


func _on_siguiente_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_GAME)


func _on_menu_button_down():
	$AudioStreamPlayer.play()


func _on_siguiente_button_down():
	$AudioStreamPlayer.play()
