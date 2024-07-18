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
	2 : preload("res://Menus/Menu_Tutorial.tscn"),
	3 : preload("res://Menus/Creditos.tscn")
}

func change_scene_to(option : Scenes):
	get_tree().change_scene_to_packed(loaded_scenes[option])
