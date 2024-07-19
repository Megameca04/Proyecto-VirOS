extends Node

func game_ends(victory : bool):
	get_tree().paused = true
	
	if victory:
		$GameUI.show_animation("MainGame/Victory")
	else:
		$GameUI.show_animation("MainGame/Game_over")

func reset_game():
	get_tree().paused = false
	get_tree().reload_current_scene()

func go_to_menu():
	get_tree().paused = false
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)

func show_pause():
	get_tree().paused = true
	$GameUI.show_animation("MainGame/Pause")

func hide_pause():
	$GameUI.show_animation("MainGame/PauseHide")
	get_tree().paused = false
