extends Control

func _on_menu_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)


func _on_siguiente_pressed():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_GAME)
