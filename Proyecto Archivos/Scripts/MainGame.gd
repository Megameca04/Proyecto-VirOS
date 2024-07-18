extends Node

func game_ends(victory : bool):
	get_tree().paused = true
	
	if victory:
		$GameUI.show_animation("Victory")
	else:
		$GameUI.show_animation("Game_over")

func reset_game():
	get_tree().paused = false
	get_tree().reload_current_scene()

func go_to_menu():
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_MENU)
