extends Node

enum Scenes {
	MAIN_GAME,
	MAIN_MENU,
	TUTORIAL_MENU,
	CREDITS_MENU
}

var loaded_scenes = {
	0 : preload("res://Menus/MainGame.tscn"),
	1 : preload("res://Menus/Menu_Principal.tscn"),
	2 : preload("res://Menus/Tutorial.tscn"),
	3 : preload("res://Menus/Creditos.tscn")
}

var watched_tutorial = false

func change_scene_to(option : Scenes):
	if option == Scenes.MAIN_GAME:
		if !watched_tutorial:
			get_tree().change_scene_to_packed(loaded_scenes[Scenes.TUTORIAL_MENU])
		else:
			get_tree().change_scene_to_packed(loaded_scenes[Scenes.MAIN_GAME])
	else:
		get_tree().change_scene_to_packed(loaded_scenes[option])
	

